//
//  SceneDelegate.swift
//  PayStackTest
//
//  Created by Zarrar Company on 28/02/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import SwiftUI
import UIKit

struct VCSwiftUIView: UIViewControllerRepresentable {
    let storyboard: String
    let VC: String

  func makeUIViewController(context: UIViewControllerRepresentableContext<VCSwiftUIView>) -> ViewController {
 
    let loadedStoryboard = UIStoryboard(name: storyboard, bundle: nil)
     return loadedStoryboard.instantiateViewController(withIdentifier: VC) as! ViewController
    
  }
  
  func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<VCSwiftUIView>) {
  }
}
