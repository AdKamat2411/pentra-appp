//
//  BrandingImage.swift
//  TinderClone
//
//  Created by Aditya Kamat on 09/10/2023.
//

import SwiftUI

struct BrandingImage: View {
    var size: CGFloat = 150
    
    var body: some View {
        Image("pentra")
            .resizable()
            .frame(width: size, height: size)
            .padding()
    }
}

#Preview {
    BrandingImage()
}
