//
//  EAMConstraintModifier.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 17/05/24.
//
import SwiftUI

extension View {
    
    func constraint(alignment: Alignment? = .topLeading,
                            padding: CGFloat? = nil,
                            topMargin: CGFloat? = nil,
                            leftMargin: CGFloat? = nil,
                            rightMargin:  CGFloat? = nil,
                            bottomMargin: CGFloat? = nil) -> some View {
        self.modifier(ConstraintModifier(alignment: alignment,
                                         padding: padding,
                                         topMargin: topMargin,
                                         leftMargin: leftMargin,
                                         rightMargin: rightMargin,
                                         bottomMargin: bottomMargin))
    }
}


 struct ConstraintModifier: ViewModifier {
    
    let alignment: Alignment?
    var padding: CGFloat? = 10
    let topMargin: CGFloat?
    let leftMargin: CGFloat?
    let rightMargin: CGFloat?
    let bottomMargin: CGFloat?
  
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment ?? .topLeading)
            .padding(.top, topMargin ?? padding)
            .padding(.leading, leftMargin ?? padding)
            .padding(.trailing, rightMargin ?? padding)
            .padding(.bottom, bottomMargin ?? padding)                    
    }
}
