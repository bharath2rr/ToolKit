//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMActivtyIndicator.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 24/09/24.
//

import SwiftUI

struct EAMActivityIndicator: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(width: 50, height: 50)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
