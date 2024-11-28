//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMHideViewModifier.swift
//  EAMNext
// 
//  Created by NIKTE Mayuri on 11/06/24.
//


import SwiftUI

struct EAMHideViewModifier: ViewModifier {
    let isHidden: Bool
    @ViewBuilder func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}

// Extending on View to apply to all Views
extension View {
    func hide(if isHiddden: Bool) -> some View {
        ModifiedContent(content: self,
                        modifier: EAMHideViewModifier(isHidden: isHiddden)
        )
    }
}
