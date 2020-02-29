//
//  HostingController.swift
//  PayStackTest
//
//  Created by Zarrar Company on 28/02/2020.
//  Copyright © 2020 Zarrar Company. All rights reserved.
//

import SwiftUI

class HostingController: UIHostingController<AnyView> {

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: AnyView(EmptyView()))
    }
}
