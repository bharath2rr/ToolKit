//
//  EAMDefaultButton.swift
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 19/09/24.
//

import SwiftUI

struct EAMDefaultButton: View {
    
    enum Style {
        case plain
        case round(showBorder: Bool = false)
        case square(showBorder: Bool = false)
        case capsule(showBorder: Bool = false)
        case roundCorner(cornerRadius: CGFloat, showBorder: Bool = false)
    }
    
    var style: Style = .plain
    let title: String
    var typography: EAMTypography = .bodyLarge
    var colorScheme: EAMColorScheme? = nil
    var isFontText: Bool = false
    var isEnabled: Bool = true
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var cornerRadius: CGFloat? = nil
    var isWidthInfinity: Bool = false
    var isHeightInfinity: Bool = false
    var padding: CGFloat? = nil
    
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.getFont(isFontText: isFontText, typography: typography, defaultSize: EAMTypography.body.size))
                .frame(width: width, height: height)
                .frame(maxWidth: isWidthInfinity ? .infinity : width)
                .frame(maxHeight: isHeightInfinity ? .infinity : height)
                .foregroundColor(defaultColorScheme.foreground)
                .padding(padding ?? 15)
                .background(defaultColorScheme.background ?? .clear)
                .lineSpacing(typography.lineHeight - typography.size)
                .frame(minHeight: height == nil ? typography.lineHeight : height)
                .overlay(
                    shape
                        .stroke(defaultColorScheme.border ?? .clear, lineWidth: borderWidth)
                        .opacity(showBorder ? 1 : 0)
                )
                .clipShape(shape)
        }
        .disabled(!isEnabled)
        .buttonStyle(PlainButtonStyle())
    }
    
    private var defaultColorScheme: EAMColorScheme {
            let defaultColorScheme = colorScheme ?? EAMColorScheme(foreground: EAMTheme.eamColors.primary, background: .clear, border: .clear)
            return defaultColorScheme.disabledIfNeeded(!isEnabled)
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
            return showBorder ? 2 : 0
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
    
    private var shape: AnyShape {
        switch style {
        case .plain, .square:
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius ?? 0))
        case .round:
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius ?? 20))
        case .capsule:
            return AnyShape(Capsule())
        case .roundCorner(_, _):
            return AnyShape(RoundedRectangle(cornerRadius: borderRadius))
        }
    }
}

struct AnyShape: Shape {
    private let _path: (CGRect) -> Path

    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            wrapped.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}



//import SwiftUI
//
//struct EAMDefaultButton: View {
//    
//    enum Style {
//        case plain
//        case round(showBorder: Bool = false)
//        case square(showBorder: Bool = false)
//        case capsule(showBorder: Bool = false)
//        case roundCorner(cornerRadius: CGFloat, showBorder: Bool = false)
//    }
//    
//    var style: Style = .plain
//    let title: String
//    var typography: EAMTypography = .bodyLarge
//    var colorScheme: EAMColorScheme? = nil
//    var isFontText: Bool = false
//    var width: CGFloat? = nil
//    var height: CGFloat? = nil
//    var cornerRadius: CGFloat? = nil
//    var isWidthInfinity: Bool = false
//    var isHeightInfinity: Bool = false
//    var padding: CGFloat? = nil
//    
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(Font.getFont(isFontText: isFontText, typography: typography, defaultSize: EAMTypography.body.size))
//                .frame(width: width, height: height)
//                .frame(maxWidth: isWidthInfinity ? .infinity : width)
//                .frame(maxHeight: isHeightInfinity ? .infinity : height)
//                .foregroundColor(colorScheme?.foreground ?? EAMColorScheme.onSurface.foreground)
//                .padding(padding ?? 16)
//                .background(colorScheme?.background ?? .clear)
//                .lineSpacing(typography.lineHeight - typography.size)
//                .frame(minHeight: height == nil ? typography.lineHeight : height)
//                .overlay(
//                    shape
//                        .stroke(colorScheme?.border ?? .clear, lineWidth: borderWidth)
//                        .opacity(showBorder ? 1 : 0)
//                )
//                .clipShape(shape)
//                
//        }
//    }
//    
//    private var borderRadius: CGFloat {
//        switch style {
//        case .round: return 20
//        case .square, .plain: return 0
//        case .capsule: return 25
//        case .roundCorner(let radius, _): return radius
//        }
//    }
//    
//    private var borderWidth: CGFloat {
//        switch style {
//        case .round(let showBorder), .square(let showBorder), .capsule(let showBorder), .roundCorner(_, let showBorder):
//            return showBorder ? 1 : 0
//        case .plain: return 0
//        }
//    }
//    
//    private var showBorder: Bool {
//        switch style {
//        case .round(let showBorder), .square(let showBorder), .capsule(let showBorder), .roundCorner(_, let showBorder):
//            return showBorder
//        case .plain: return false
//        }
//    }
//    
//    private var shape: some Shape {
//        switch style {
//        case .plain, .square:
//            return RoundedRectangle(cornerRadius: cornerRadius ?? 0)
//        case .round, .capsule:
//            return RoundedRectangle(cornerRadius: cornerRadius ?? 25)
//        case .roundCorner(_, _):
//            return RoundedRectangle(cornerRadius: borderRadius)
//        }
//    }
//}
