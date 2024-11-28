//
//  EAMDefaultInputText.swift
//  UITest
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 19/09/24.
//
import SwiftUI

struct EAMDefaultTextInput: View {
    
    enum InputType {
        case text
        case number
    }
    
    enum InputIndicator {
        case picker
        case date
        case textfield
    }
    
    @Binding var text: String
    @Binding var number: Double
    var type: InputType = .text
    var placeholder: String = "Enter text"
    var typography: EAMTypography? = nil
    var colorScheme: EAMColorScheme = .onSurface
    var isSecure: Bool = false
    var textAlignment: TextAlignment = .leading
    var isEditable: Bool = true
    var keyboardType: UIKeyboardType? = .default
    var inputIndicator: InputIndicator? = .textfield
    var cornerRadius: CGFloat? = nil
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var isInfinity: Bool = false
    var maxLength: Int? = nil 
    var padding: CGFloat? = nil
    var showBorder: Bool = false

    init(
        text: Binding<String> = .constant(""),
        number: Binding<Double> = .constant(0.0),
        type: InputType = .text,
        placeholder: String = "Enter text",
        typography: EAMTypography? = nil,
        colorScheme: EAMColorScheme = .onSurface,
        isSecure: Bool = false,
        textAlignment: TextAlignment = .leading,
        isEditable: Bool = true,
        keyboardType: UIKeyboardType? = .default,
        inputIndicator: InputIndicator? = .textfield,
        cornerRadius: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        isInfinity: Bool = false,
        maxLength: Int? = nil,
        padding: CGFloat? = nil,
        showBorder: Bool = false) {
        
        self._text = text
        self._number = number
        self.type = type
        self.placeholder = placeholder
        self.typography = typography
        self.colorScheme = colorScheme
        self.isSecure = isSecure
        self.textAlignment = textAlignment
        self.isEditable = isEditable
        self.keyboardType = keyboardType
        self.inputIndicator = inputIndicator
        self.cornerRadius = cornerRadius
        self.width = width
        self.height = height
        self.isInfinity = isInfinity
        self.maxLength = maxLength
        self.padding = padding
        self.showBorder = showBorder
    }

    var body: some View {
        if type == .text {
        HStack {
            TextField(placeholder, text: Binding(
                get: { text },
                set: { newValue in
                    if let maxLength = maxLength, newValue.count > maxLength {
                        text = String(newValue.prefix(maxLength))
                    } else {
                        text = newValue
                    }
                }
            ))
            .font(typography?.font ?? EAMTypography.body.font)
            .foregroundColor(isEditable ? colorScheme.foreground : .gray)
            .frame(width: width, height: height)
            .padding(padding ?? 16)
            .cornerRadius(cornerRadius ?? 8)
            .keyboardType(keyboardType ?? .default)
            .disabled(!isEditable)
            .multilineTextAlignment(textAlignment)
            .frame(maxWidth: isInfinity ? .infinity : width)
            .frame(maxHeight: isInfinity ? .infinity : height)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius ?? 8)
                    .fill(colorScheme.background!) // Circle for background
            )
            .padding(0.5)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius ?? 8)
                    .fill(showBorder ? EAMTheme.eamColors.outline : colorScheme.background!) // Circle for the border
            )
            
            if let image = inputIndicatorImage() {
                image
                    .padding(.trailing, 5)
                    .foregroundColor(colorScheme.foreground ?? .gray)
            }
        }
    }
        else {
            TextField(placeholder, value: $number, format: .number)
                .textFieldStyle(.plain)
                .keyboardType(keyboardType ?? .numberPad)
                .font(typography?.font ?? EAMTypography.body.font)
                .foregroundColor(isEditable ? colorScheme.foreground : .gray)
                .multilineTextAlignment(textAlignment)
                .frame(maxWidth: isInfinity ? .infinity : width)
                .frame(maxHeight: isInfinity ? .infinity : height)
        }
    }
    
    private func inputIndicatorImage() -> Image? {
        switch inputIndicator {
        case .picker:
            return Image(systemName: "chevron.down")
        case .date:
            return Image(systemName: "calendar")
        case .textfield, .none:
            return nil
        }
    }
}
