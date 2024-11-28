//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMPicker.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 06/09/24.
//


import SwiftUI

/// A custom picker view with a scrollable list style, including title, text input, clear button, and done button.
struct EAMPicker: View {
    @State private var selectedItem: String?
    @State private var textInput: String = ""
    var title: String
    var items: [String] // List of items for the picker
    var onDone: (String?) -> Void
    
    // Initializer with default values
    init(title: String? = nil, initialItem: String?, items: [String], onDone: @escaping (String?) -> Void) {
        self.title = title ?? "Select Item"
        _selectedItem = State(initialValue: initialItem)
        _textInput = State(initialValue: initialItem ?? "")
        self.items = items
        self.onDone = onDone
    }
    
    var body: some View {
        EAMVStack(style: .none) {
            EAMHStack(style: .none) {
//                EAMText(type: .headline, text: title)
//                    .constraint(alignment: .leading, padding: 0)
            }
            
            EAMHStack(style: .none) {
                // EAMTextInput takes up the remaining space
                EAMTextInput( text: $textInput, type: .bordered, placeholder: "Enter item")
                    .padding(.trailing, 10)
            
                EAMButton(text: "Clear", type: .primary) {
                    textInput = "" // Clear the text input
                     selectedItem = nil // Reset to nil
                }.frame(width: 80, height: 50) // Set fixed width
            }
            .padding([.leading, .trailing])
            
            Picker(
                "",
                selection: Binding(
                    get: { selectedItem ?? items.first ?? "" }, // Default to first item if none selected
                    set: { newItem in
                        selectedItem = newItem
                        textInput = newItem // Update TextField when item changes from Picker
                    }
                )
            ) {
                ForEach(items, id: \.self) { item in
                    Text(item).tag(item)
                }
            }
            .pickerStyle(WheelPickerStyle()) // Scrollable style
            .frame(width: 300, height: 200)
            
            EAMButton(text: "Done", type: .primary) {
                if items.contains(textInput) {
                    onDone(textInput) // Notify about the change
                } else {
                    onDone(nil) // No valid item selected
                }
            }.constraint(alignment: .bottom, padding: 10)
        }
        .background(Color.white)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Adjust corner radius for the border
                .stroke(Color.gray.opacity(0.4), lineWidth: 1) // Border color
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2) // Shadow
        )
        .onAppear {
            // Initialize text input with the selected item
            if let item = selectedItem {
                textInput = item
            } else {
                textInput = "" // Ensure textInput is empty if no item is set
            }
        }
    }
}

