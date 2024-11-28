//
//  GESearch.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 21/05/24.

import SwiftUI

/// A custom search bar view that allows for search text input,
/// notifies on search action completion, text change, and cancel action.
struct EAMSearchBar: View {
    
    /// The binding to the text entered in the search bar.
    @Binding var text: String
    

    var shouldShowMagnifyingGlass = true

    /// The placeholder text displayed in the search bar.
    @Binding var placeholder: String

    @Binding var showActivityIndicator: Bool
    
    /// The background color of the search bar.
    var background: Color? = Color(.systemGray3)
    
    /// The width of the search bar.
    var width: CGFloat?
    
    /// The height of the search bar.
    var height: CGFloat? = 35
    
    /// The corner radius of the search bar.
    var cornerRadius: CGFloat = 20
    
    /// The closure to be executed when the search action completes.
    var onSearch: (String) -> Void
    
    /// The closure to be executed when the text changes.
    var onChange: (String) -> Void = { _ in }
        
    
    /// The closure to be executed when the cancel action is triggered.
    var onCancel: () -> Void
    
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text, onCommit: {
                onSearch(searchText)
            })
            .padding(7)
            .padding(.horizontal, 25)
            .frame(width: width, height: height)
            .background(background)
            .cornerRadius(cornerRadius)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .hide(if: !shouldShowMagnifyingGlass)
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    if showActivityIndicator {
                        ProgressView()
                            .tint(EAMTheme.eamColors.primary)
                            .constraint(alignment: .trailing)
                    }
                    if !text.isEmpty  && !showActivityIndicator {
                        EAMButton(text: "", type: .primaryText, isFontText: true, action: {
                            text = ""
                            onCancel()
                        }).constraint(alignment: .trailing)
                    }
                }
            )
            .onChange(of: text) { _ in
                searchText = text
                print("search text: \(text)")
                onChange(text)
            }
        }
    }
}
