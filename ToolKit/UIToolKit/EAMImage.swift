//
//  EAMDialog.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 21/05/24.
//

import SwiftUI


struct EAMImage: View {
    let image: UIImage
    let width: CGFloat?
    let height: CGFloat?

    init(image: UIImage, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.image = image
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit) // Fit the image within the view frame
            .frame(width: width, height: height)
    }
}
