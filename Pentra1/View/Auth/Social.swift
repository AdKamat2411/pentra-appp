//
//  Social.swift
//  TinderClone
//
//  Created by Aditya Kamat on 18/10/2023.
//

import SwiftUI

struct Social: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 1){
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 206, height: 86.07764)
              .background(
                Image("pentra_logo")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 206, height: 86.07763671875)
                  .clipped()
              )
            
            Text("Where can brands sponsor you?")
              .font(Font.custom("OldStandardTT-Regular", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            Text("Instagram @")
              .font(Font.custom("Old Standard TT", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                    .frame(width: 275, height: 43)

                TextField("@example", text: $viewModel.ig)
                    .autocapitalization(.none)
                    .foregroundColor(.white)
                    .frame(width: 275, height: 43)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0))
                    .padding(.leading)
                    .cornerRadius(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.44), lineWidth: 1)
                    )
            }
            
            Text("TikTok @")
              .font(Font.custom("Old Standard TT", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                    .frame(width: 275, height: 43)

                TextField("@example", text: $viewModel.tiktok)
                    .autocapitalization(.none)
                    .foregroundColor(.white)
                    .frame(width: 275, height: 43)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0))
                    .padding(.leading)
                    .cornerRadius(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.44), lineWidth: 1)
                    )
            }
            
            Text("Youtube Channel Link")
              .font(Font.custom("Old Standard TT", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                    .frame(width: 275, height: 43)

                TextField("@example", text: $viewModel.yt)
                    .autocapitalization(.none)
                    .foregroundColor(.white)
                    .frame(width: 275, height: 43)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0))
                    .padding(.leading)
                    .cornerRadius(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.44), lineWidth: 1)
                    )
            }
            
            NavigationLink {
                FinalStep()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("NEXT")
                  .font(
                    Font.custom("Cabin", size: 15)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.28, green: 0.25, blue: 0.25))
                  .frame(width: 49.47186, height: 28, alignment: .center)
                  .foregroundColor(.clear)
                  .frame(width: 105, height: 53)
                  .background(Color(red: 1, green: 0.83, blue: 0.83))

                  .cornerRadius(30)
            }
            .padding()
        }
        .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 161/255, green: 69/255, blue: 56/255))
    }
}

#Preview {
    Social()
        .environmentObject(AuthViewModel())
}


