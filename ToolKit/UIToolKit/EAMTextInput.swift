//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMTextInput.swift
//  EAMNext
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 22/08/24.
//

import SwiftUI

struct EAMTextInput: View {
    enum TextInputType {
        case primary
        case secondary
        case highlighted
        case plain
        case graySquareNumber
        case grayRoundBar
        case bordered
        case date
        case borderedGray
    }
    
    @Binding var text: String
    @Binding var number: Double
    let type: TextInputType
    var placeholder: String = "Enter text"

    init(text: Binding<String> = .constant(""),
         number: Binding<Double> = .constant(0.0),
        type: TextInputType,
        placeholder: String = "Enter text"
    ) {
        self.type = type
        self._text = text
        self._number = number
        self.placeholder = placeholder
    }

    var body: some View {
        HStack {
            inputView
        }
    }

    @ViewBuilder
    private var inputView: some View {
        switch type {
        case .primary:
            PrimaryTextInput(text: $text, placeholder: placeholder)
        case .secondary:
            SecondaryTextInput(text: $text, placeholder: placeholder)
        case .highlighted:
            HighlightedTextInput(text: $text, placeholder: placeholder)
        case .plain:
            PlainTextInput(text: $text, placeholder: placeholder)
        case .graySquareNumber:
            GraySquareNumberTextInput(number: $number, placeholder: placeholder)
        case .bordered:
            BorderedTextInput(text: $text, placeholder: placeholder)
        case .grayRoundBar:
            GrayRoundBarTextInput(number: $number, placeholder: placeholder)
        case .date:
            DateTextInput(text: $text, placeholder: placeholder)
        case .borderedGray:
            BorderedGrayTextInput(text: $text, placeholder: placeholder)
        }
    }
}

private struct PrimaryTextInput: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        EAMDefaultTextInput(text: $text)
    }
}

private struct SecondaryTextInput: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        EAMDefaultTextInput(text: $text)
            .shadow(radius: 2)
    }
}

private struct HighlightedTextInput: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        EAMDefaultTextInput(text: $text)
            .padding()
            .shadow(radius: 2)
    }
}

private struct PlainTextInput: View {
    @Binding var text: String
    var placeholder: String
    
    var typography: EAMTypography = .bodyLarge
    let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface, background: EAMTheme.eamColors.surface)


    var body: some View {
        EAMDefaultTextInput(text: $text, typography: typography, colorScheme: colorScheme)
    }
}

private struct GraySquareNumberTextInput: View {
    @Binding var number: Double
    var placeholder: String
    let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)
    
    var body: some View {
        EAMDefaultTextInput(number: $number, type: .number, placeholder: "", typography: isPhone ? .body : .bodyMax, colorScheme: colorScheme, textAlignment: .center, keyboardType: .decimalPad)
            .frame(width: 100, height: 50)
            .background(RoundedRectangle(cornerRadius: 8).fill(EAMTheme.eamColors.outlineVariant))
            .padding(.horizontal, 5)
    }
}

private struct GrayRoundBarTextInput: View {
    @Binding var number: Double
    var placeholder: String
    let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)
    
    var body: some View {
        EAMDefaultTextInput(number: $number, type: .number, placeholder: "", typography: isPhone ? .body : .bodyMax, colorScheme: colorScheme, textAlignment: .leading, keyboardType: .decimalPad)
            .padding(.leading)
            .frame(width: 180, height: 50)
            .background(RoundedRectangle(cornerRadius: 50/2).fill(EAMTheme.eamColors.outlineVariant))
            .padding(.horizontal, 5)
    }
}

private struct BorderedTextInput: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue, lineWidth: 1))
    }
}

private struct BorderedGrayTextInput: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        TextField(placeholder, text: $text)
            .multilineTextAlignment(.center)
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
    }
}


private struct DateTextInput: View {
    @Binding var text: String
    var placeholder: String = "Enter date"
    let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurfaceVariant, background: EAMTheme.eamColors.surfaceVariant)
    
    var body: some View {
        EAMDefaultTextInput(text: $text,  placeholder: placeholder , colorScheme: colorScheme, cornerRadius: 2, height: 30, showBorder: true)
    }
}
