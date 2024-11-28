//
//  EAMDefaultText.swift
//  UITest
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 18/09/24.
//

import SwiftUI

struct EAMDefaultText: View {
    
    enum Style {
        case plain
        case round(showBorder: Bool = false)
        case square(showBorder: Bool = false)
        case capsule(showBorder: Bool = false)
        case roundCorner(cornerRadius: CGFloat, showBorder: Bool)
    }
    
    let text: String
    var style: Style = .plain
    var typography: EAMTypography = .bodyLarge
    var colorScheme: EAMColorScheme = .onSurface
    var isFontText: Bool = false
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var cornerRadius: CGFloat? = nil
    var isInfinity: Bool = false
    var padding: CGFloat? = nil

    var body: some View {
        Text(text)
            .font(Font.getFont(isFontText: isFontText, typography: typography, defaultSize: EAMTypography.body.size))
            .frame(width: width, height: height) // Explicitly set width and height if provided
            .foregroundColor(colorScheme.foreground ?? .primary)
            .background(colorScheme.background ?? .clear)
            .padding(padding ?? 16)
            .lineSpacing(typography.lineHeight - typography.size)
            .frame(minHeight: height == nil ? typography.lineHeight : height)
            .overlay(
                shape
                    .stroke(colorScheme.border ?? .clear, lineWidth: borderWidth)
                    .opacity(showBorder ? 1 : 0)
            )
            .clipShape(shape)            
            .frame(maxWidth: isInfinity ? .infinity : width)
            .frame(maxHeight: isInfinity ? .infinity : height)
    }
    
    private var borderRadius: CGFloat {
        switch style {
        case .round: return 20
        case .square, .plain: return 0
        case .capsule: return 25
        case .roundCorner(let radius, _): return radius
        }
    }
    
    private var borderWidth: CGFloat {
        switch style {
        case .round(let showBorder), .square(let showBorder), .capsule(let showBorder), .roundCorner(_, let showBorder):
            return showBorder ? 1 : 0
        case .plain: return 0
        }
    }
    
    private var showBorder: Bool {
        switch style {
        case .round(let showBorder), .square(let showBorder), .capsule(let showBorder), .roundCorner(_, let showBorder):
            return showBorder
        case .plain: return false
        }
    }
    
    private var shape: some Shape {
        switch style {
        case .plain, .square:
            return RoundedRectangle(cornerRadius: 0)
        case .round, .capsule:
            return RoundedRectangle(cornerRadius: cornerRadius ?? 25) // Default cornerRadius for round and capsule
        case .roundCorner(_, _):
            return RoundedRectangle(cornerRadius: borderRadius)
        }
    }
}
