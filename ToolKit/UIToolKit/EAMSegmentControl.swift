//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMSegmentControl.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 08/06/24.
//

import SwiftUI

/// A custom segmented control view with customizable titles, dimensions, and corner radius.
struct EAMSegmentedControl: View {
    var segmentItems: [String]
    @Binding var selectedIndex: Int
    var width: CGFloat?
    var height: CGFloat? = 40
    var cornerRadius: CGFloat = 20
    var selectedColor: Color?
    var unselectedColor: Color?
    private var colors: EAMColors {
        EAMTheme.eamColors
    }
    
    var body: some View {
            return AnyView(
                VStack {
                    Picker(selection: $selectedIndex, label: Text("Picker")) {
                        ForEach(segmentItems.indices, id: \.self) { index in
                            EAMText(text: segmentItems[index])
                                .frame(width: (width ?? UIScreen.main.bounds.width - 40) / CGFloat(segmentItems.count), height: height)
                                .background(selectedIndex == index ? selectedColor ?? colors.primary  : unselectedColor ?? colors.surfaceContainer)
                                .foregroundColor(selectedIndex == index ? colors.surface : colors.onSurface)
                                .cornerRadius(cornerRadius)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: width, height: height)
                }
                .frame(width: width, height: height)
            )
    }
}
