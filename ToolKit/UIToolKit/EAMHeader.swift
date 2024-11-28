//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMHeader.swift
//  EAMNext
// 
//  Created by NIKTE Mayuri on 11/09/24.
//

import SwiftUI

public struct EAMHeaderView: View {
    var title: String
    var showSaveButton: Bool = false
    var presentationFullScreen: Bool = false
    var onClose: (() -> Void)?
    var onSave: (() -> Void)?

    public var body: some View {
        EAMVStack(style: .none) {
            EAMZStack(style: .none) {
                EAMButton(text: "Close", type: .navigationItem) {
                    onClose?()
                }
                .constraint(alignment: .leading, leftMargin: 10)
                
                EAMText(text: title, type: .navigationTitle)
                    .constraint(alignment: .center)
                
                if showSaveButton {
                    EAMButton(text: "Save", type: .navigationItem) {
                        onSave?()
                    }
                    .constraint(alignment: .trailing, rightMargin: 10)
                }
            }
            .frame(height: isPhone ? 50 : 60)
            
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3)),
                alignment: .bottom
            )
            .padding(.top, (isPhone || presentationFullScreen) ? getSafeAreaTopPadding() : 5)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [EAMTheme.eamColors.surface]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blur(radius: 10)
        )
        .padding(.horizontal, 0)
        .edgesIgnoringSafeArea(.all)
    }

    private func getSafeAreaTopPadding() -> CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window.safeAreaInsets.top
        }
        return 0
    }
}
