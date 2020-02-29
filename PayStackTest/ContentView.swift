//
//  ContentView.swift
//  PayStackTest
//
//  Created by Zarrar Company on 28/02/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import SwiftUI
import Paystack
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            VCSwiftUIView(storyboard: "Storyboard", VC: "initialVC")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
