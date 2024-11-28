//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMPopoverWindow.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 09/09/24.
//

import SwiftUI

final class EAMPopoverWindowManager: ObservableObject {
    @Published var hostingController: UIHostingController<AnyView>? = nil
}

struct EAMPopoverWindowModifier<PopoverContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    var backgroundColor: Color?
    var alignment: Alignment = .center
    var margin: EdgeInsets = EdgeInsets()
    let content: () -> PopoverContent
    @StateObject private var popoverManager = EAMPopoverWindowManager()

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { newValue in
                newValue ? showPopover() : hidePopover()
            }
    }

    private func showPopover() {
        guard let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first(where: \.isKeyWindow) else {
            print("No key window found")
            return
        }

        let popoverContent = ZStack {
            self.content()
                .background(Color.clear) // Clear background for the content
                .padding(margin) // Apply padding
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
        }
        .background(Color.clear) // Ensure background is clear

        let hostingController = UIHostingController(rootView: AnyView(popoverContent))
        hostingController.view.backgroundColor = UIColor.clear

        window.addSubview(hostingController.view)
        applyConstraints(to: hostingController.view, in: window)
        popoverManager.hostingController = hostingController
    }

    private func applyConstraints(to popoverView: UIView, in window: UIWindow) {
        popoverView.translatesAutoresizingMaskIntoConstraints = false
        let margins = window.layoutMarginsGuide
        
        let navBarHeight = UINavigationController().navigationBar.frame.height
        
        let alignmentConstraints: [NSLayoutConstraint] = {
            switch alignment {
            case .topLeading:
                return [
                    popoverView.topAnchor.constraint(equalTo: margins.topAnchor, constant: margin.top  + navBarHeight),
                    popoverView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: margin.leading)
                ]
            case .topTrailing:
                return [
                    popoverView.topAnchor.constraint(equalTo: margins.topAnchor, constant: margin.top + navBarHeight),
                    popoverView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -margin.trailing)
                ]
            case .top:
                return [
                    popoverView.topAnchor.constraint(equalTo: margins.topAnchor, constant: margin.top + navBarHeight),
                    popoverView.centerXAnchor.constraint(equalTo: window.centerXAnchor)
                ]
            case .bottom:
                return [
                    popoverView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -margin.bottom),
                    popoverView.centerXAnchor.constraint(equalTo: window.centerXAnchor)
                ]
            case .bottomLeading:
                return [
                    popoverView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -margin.bottom),
                    popoverView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: margin.leading)
                ]
            case .bottomTrailing:
                return [
                    popoverView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -margin.bottom),
                    popoverView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -margin.trailing)
                ]
            case .leading:
                return [
                    popoverView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                    popoverView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: margin.leading)
                ]
            case .trailing:
                return [
                    popoverView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                    popoverView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -margin.trailing)
                ]
            default:
                return [
                    popoverView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                    popoverView.centerYAnchor.constraint(equalTo: window.centerYAnchor)
                ]
            }
        }()
        
        NSLayoutConstraint.activate(alignmentConstraints)
    }


    private func hidePopover() {
        popoverManager.hostingController?.view.removeFromSuperview()
        popoverManager.hostingController = nil
        isPresented = false
    }
}

extension View {
    func addPopoverWindow<Content: View>(
        isPresented: Binding<Bool>,
        backgroundColor: Color? = Color.black.opacity(0.3),
        alignment: Alignment = .center,
        margin: EdgeInsets = EdgeInsets(),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.modifier(EAMPopoverWindowModifier(
            isPresented: isPresented,
            backgroundColor: backgroundColor,
            alignment: alignment,
            margin: margin,
            content: content
        ))
    }
}

