//
//  LoadingOverlayView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 10/10/2023.
//

import SwiftUI

struct LoadingOverlayView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            Spacer()
            ProgressView()
            Spacer()
        }
        .background(Color.black.opacity(0.25))
    }
}

#Preview {
    LoadingOverlayView()
}
