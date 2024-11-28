//
//  EAMStack.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 18/05/24.
//

import SwiftUI

struct EAMUIDebugMode {
    static let isLayoutDebug: Bool = false
}

enum EAMZStackStyle {
    case none
    case compact
    case medium
    case regular
    case spacious
    case wide
    case custom(spacing: CGFloat)
}

enum EAMHStackStyle {
    case none
    case compact
    case medium
    case regular
    case spacious
    case wide
    case custom(spacing: CGFloat, alignment: SwiftUI.VerticalAlignment)
}

enum EAMVStackStyle {
    case none
    case compact
    case medium
    case regular
    case spacious
    case wide
    case custom(spacing: CGFloat, alignment: HorizontalAlignment)
}


struct EAMZStack<Content: View>: View {
    let style: EAMZStackStyle
    let alignment: Alignment
    let content: () -> Content
    
    init(style: EAMZStackStyle = .regular, alignment: Alignment = .topLeading, @ViewBuilder content: @escaping () -> Content) {
        self.style = style
        self.alignment = alignment
        self.content = content
    }
    
    var body: some View {
        let spacing: CGFloat
        
        switch style {
        case .none:
            spacing = 1
        case .compact:
            spacing = 5
        case .medium:
            spacing = 10
        case .regular:
            spacing = 15
        case .spacious:
            spacing = 20
        case .wide:
            spacing = 30
        case .custom(let customSpacing):
            spacing = customSpacing
        }
        
        return ZStack(alignment: alignment) {
            Group {
                content()
            }.padding(0)
        }
        .padding(spacing)
        .background(EAMUIDebugMode.isLayoutDebug ? Color.red : nil)
    }
}

struct EAMHStack<Content>: View where Content: View {
    let style: EAMHStackStyle
    let padding: CGFloat
    let content: () -> Content
    
    init(style: EAMHStackStyle = .regular, padding: CGFloat = 0, @ViewBuilder content: @escaping () -> Content) {
        self.style = style
        self.padding = padding
        self.content = content
    }
    
    var body: some View {
        let spacing: CGFloat
        var alignment: SwiftUI.VerticalAlignment = .center
        
        switch style {
        case .none:
            spacing = 1
        case .compact:
            spacing = 5
        case .medium:
            spacing = 10
        case .regular:
            spacing = 15
        case .spacious:
            spacing = 20
        case .wide:
            spacing = 30
        case .custom(let customSpacing, let customAlignment):
            spacing = customSpacing
            alignment = customAlignment
        }
        return HStack(alignment: alignment, spacing: spacing, content: content)
            .background(EAMUIDebugMode.isLayoutDebug ? Color.blue : nil)
            .padding(padding)
    }
}


struct EAMVStack<Content>: View where Content: View {
    let style: EAMVStackStyle
    let padding: CGFloat
    let content: () -> Content
    
    init(style: EAMVStackStyle = .regular, padding: CGFloat = 0, @ViewBuilder content: @escaping () -> Content) {
        self.style = style
        self.padding = padding
        self.content = content
    }
    
    var body: some View {
        let spacing: CGFloat
        var alignment: HorizontalAlignment = .center
        
        switch style {
        case .none:
            spacing = 1
        case .compact:
            spacing = 5
        case .medium:
            spacing = 10
        case .regular:
            spacing = 15
        case .spacious:
            spacing = 20
        case .wide:
            spacing = 30
        case .custom(let customSpacing, let customAlignment):
            spacing = customSpacing
            alignment = customAlignment
        }
    
        return VStack(alignment: alignment, spacing: spacing, content: content)
            .background(EAMUIDebugMode.isLayoutDebug ? Color.yellow : nil)
            .padding(padding)
    }
}
