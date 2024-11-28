//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMPopoverView.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 26/05/24.
//


import SwiftUI

struct EAMPopover<Content: View>: View {
    var cornerRadius: CGFloat = 15
    var borderColor: Color = EAMTheme.eamColors.outline
    @ViewBuilder let content: Content

    var body: some View {
        EAMVStack(style: .none) {
            content
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(EAMTheme.eamColors.surfaceVariant) // Circle for background
        )
        .padding(0.5)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(borderColor) // Circle for the border
        )
        .shadow(color: EAMTheme.eamColors.surfaceVariant.opacity(0.5), radius: 2, x: 0, y: 2)
        .cornerRadius(cornerRadius) // Ensures rounded corners apply to entire view
    }
}
