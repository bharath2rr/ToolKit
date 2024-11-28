//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMPresentPopoverWindow.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 09/09/24.
//

import SwiftUI

struct EAMPresentPopoverModifier<PopoverContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    var backgroundColor: Color?
    var alignment: Alignment = .center
    var margin: EdgeInsets = EdgeInsets()
    var tapToDismissOutside: Bool = true
    let content: () -> PopoverContent

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { newValue in
                newValue ? showPopover() : hidePopover()
            }
    }

    private func showPopover() {
        guard let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first,
              let rootViewController = windowScene.windows.first(where: \.isKeyWindow)?.rootViewController else {
            print("No UIWindowScene or root view controller found")
            return
        }

        let hostingController = UIHostingController(rootView:
            ZStack {
                if tapToDismissOutside {
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            hidePopover()
                        }
                }
                content()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                    .padding(margin)
            }
        )

        hostingController.view.backgroundColor = UIColor(backgroundColor ?? .clear)
        hostingController.modalPresentationStyle = .overFullScreen
        hostingController.modalTransitionStyle = .crossDissolve
        
        rootViewController.present(hostingController, animated: true)
    }

    private func hidePopover() {
        isPresented = false
        guard let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first,
              let rootViewController = windowScene.windows.first(where: \.isKeyWindow)?.rootViewController else {
            print("No UIWindowScene or root view controller found")
            return
        }

        rootViewController.dismiss(animated: true)
    }
}

extension View {
    func presentPopoverWindow<Content: View>(
        isPresented: Binding<Bool>,
        backgroundColor: Color? = Color.black.opacity(0.3),
        alignment: Alignment = .center,
        margin: EdgeInsets = EdgeInsets(),
        tapToDismissOutside: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.modifier(EAMPresentPopoverModifier(
            isPresented: isPresented,
            backgroundColor: backgroundColor,
            alignment: alignment,
            margin: margin,
            tapToDismissOutside: tapToDismissOutside,
            content: content
        ))
    }
}

