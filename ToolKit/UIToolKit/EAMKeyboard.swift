//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMKeyboard.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 28/10/24.
//


import Combine
import SwiftUI
import UIKit

// Keyboard Observer for SwiftUI
//class EAMKeyboardObserver: ObservableObject {
//    @Published var keyboardHeight: CGFloat = 0
//    private var cancellable: AnyCancellable?
//
//    init() {
//        cancellable = NotificationCenter.default.publisher(for: NSNotification.Name.UIKeyboardWillChangeFrame)
//            .compactMap { notification -> CGFloat? in
//                guard let frame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
//                    return nil
//                }
//                return frame.origin.y < UIScreen.main.bounds.height ? frame.height : 0
//            }
//            .assign(to: \.keyboardHeight, on: self)
//    }
//}

public struct EAMKeyboardDismisser: UIViewRepresentable {
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed
    }

    static func dismissKeyboard() {
        DispatchQueue.main.async {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
