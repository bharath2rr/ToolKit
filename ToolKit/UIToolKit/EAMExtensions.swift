//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMExtensions.swift
//  EAMNext
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 26/05/24.
//

import UIKit
import SwiftUI

extension UIApplication {
    var navigationBarHeight: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
        
        if let navigationController = keyWindow?.rootViewController as? UINavigationController {
            return navigationController.navigationBar.frame.height
        }
        return 0
    }
}

extension Color {
    func toUIColor() -> UIColor {
        if #available(iOS 14.0, *) {
            // If available, use UIColor initializer from SwiftUI Color
            let uiColor = UIColor(self)
        }
        // Fallback for older iOS versions
        let components = self.components()
        return UIColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }
    
    private func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension View {
    
    func applyDisabledState(_ isDisabled: Bool, overlayColor: Color = LightColors.outline.opacity(0.1), overlayText: String? = nil) -> some View {
        self
            .overlay(
                Group {
                    if isDisabled {
                        ZStack {
                            overlayColor
                            if let text = overlayText {
                                Text(text)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            )
            .disabled(isDisabled)
    }
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Font {
    
    static func custom(_ typography: EAMTypography) -> Font {
        .system(size: typography.size, weight: typography.weight)
    }
    
    static func getFont(isFontText: Bool, typography: EAMTypography?, defaultSize: CGFloat) -> Font {
        if isFontText {
            return Font.custom("FontAwesome6Free-Solid", size: (typography?.size ?? defaultSize))
        } else {
            return typography?.font ?? EAMTypography.bodyLarge.font
        }
    }
}
