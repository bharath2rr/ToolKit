//
//  EAMCard.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 22/05/24.
//

import SwiftUI

struct EAMCard<Content: View>: View {
    
    var width: CGFloat?
    var height: CGFloat?
    var padding: CGFloat?
    var cornersRadius: CGFloat?
    var cornersPadding: CGFloat?
    var containerColor: Color?
    var contentColor: Color?
    var content: Content
    var shape: RoundedRectangle
    
    init(width: CGFloat? = nil, height: CGFloat? = nil, padding:CGFloat? = 5, cornersRadius: CGFloat? = 16, cornersPadding: CGFloat? = 16, containerColor: Color? = EAMTheme.eamColors.surface, contentColor: Color? = EAMTheme.eamColors.onSurface,  @ViewBuilder content: () -> Content) {
        self.content = content()
        self.width = width
        self.height = height
        self.padding = padding
        self.cornersRadius = cornersRadius
        self.cornersPadding = cornersPadding
        self.containerColor = containerColor
        self.contentColor = contentColor
        self.shape = RoundedRectangle(cornerRadius: cornersRadius!)
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornersRadius!)
            .fill(containerColor!)
            .overlay(
                RoundedRectangle(cornerRadius: cornersRadius!)
                    .stroke(contentColor!, lineWidth: 1)
            )
            .padding(cornersPadding!) // Add padding here
            .frame(width: width, height: height)
            .overlay(
                content
                    .padding(padding!)
            )
    }
}
