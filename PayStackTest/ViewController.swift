//
//  ViewController.swift
//  PayStackTest
//
//  Created by Zarrar Company on 28/02/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import UIKit
import SwiftUI
import Paystack

class ViewController: UIViewController, PSTCKPaymentCardTextFieldDelegate {
    
    let paymentTextField = PSTCKPaymentCardTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        paymentTextField.frame = CGRect(x: 15, y: 15, width: self.view.frame.width - 30, height: 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
    }
    
    @IBAction func charge(sender: UIButton) {
        let transactionParams = PSTCKTransactionParams.init();
        let cardParams = paymentTextField.cardParams as PSTCKCardParams
        transactionParams.amount = 1390;
        let custom_filters: NSMutableDictionary = [
            "recurring": true
        ];
        let items: NSMutableArray = [
            "Bag","Glasses"
        ];
        do {
            try transactionParams.setCustomFieldValue("iOS SDK", displayedAs: "Paid Via");
            try transactionParams.setCustomFieldValue("Paystack hats", displayedAs: "To Buy");
            try transactionParams.setMetadataValue("iOS SDK", forKey: "paid_via");
            try transactionParams.setMetadataValueDict(custom_filters, forKey: "custom_filters");
            try transactionParams.setMetadataValueArray(items, forKey: "items");
        } catch {
            print(error);
        }
        transactionParams.email = "e@ma.il";

        PSTCKAPIClient.shared().chargeCard(cardParams, forTransaction: transactionParams, on: self,
                   didEndWithError: { (error, reference) -> Void in
                    let ac = UIAlertController(title: "Error", message: "Transaction Failed", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
                    self.present(ac, animated: true)
                }, didRequestValidation: { (reference) -> Void in
                    let ac = UIAlertController(title: "OTP Sent", message: "an OTP was requested, transaction has not yet succeeded", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
                    self.present(ac, animated: true)
                }, didTransactionSuccess: { (reference) -> Void in
                    let ac = UIAlertController(title: "Success", message: "transaction may have succeeded, please verify on backend", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
                    self.present(ac, animated: true)
            })
    }
}

