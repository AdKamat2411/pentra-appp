//
//  TinderInputField.swift
//  TinderClone
//
//  Created by Aditya Kamat on 09/10/2023.
//

import SwiftUI

struct TinderInputField: View {
    let imageName: String
    @State var placeholderText: String
    @Binding var text: String
    var isSecureField: Bool = false
    
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(.white))
            if isSecureField {
                SecureField(placeholderText, text: $text, prompt: Text("Placeholder text")
                    .foregroundColor(.white))
                    .font(Font.custom("Old Standard TT", size: 18))
                    .multilineTextAlignment(.leading)
                    .accentColor(.white)
            } else {
                TextField(placeholderText, text: $text, prompt: Text("Placeholder text")
                    .foregroundColor(.white))
                    .textInputAutocapitalization(.never)
                    .font(Font.custom("Old Standard TT", size: 18))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
            }
        }
        .padding(4)
        
        Divider()
            .background(Color(.white))

        
    }
}

#Preview {
    TinderInputField(imageName: "envelope", placeholderText: "email", text: .constant(""))
        .previewLayout(.sizeThatFits)
}
