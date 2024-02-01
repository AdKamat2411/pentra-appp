//
//  BrandDescription.swift
//  TinderClone
//
//  Created by Aditya Kamat on 11/01/2024.
//

import SwiftUI

struct BrandDescription: View {
    var user: User
    @StateObject var viewModel = SwipeViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0)
            {  Text("Description")
                  .font(
                    Font.custom("Old Standard TT", size: 32)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                  .frame(width: 275, height: 39, alignment: .topLeading)
                  .padding(.top)
                Divider()
                Spacer()
                
                
                
                if let bio = user.bio {
                    Text(bio)
                      .font(Font.custom("Old Standard TT", size: 22))
                      .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                      .frame(width: 275, height: 300, alignment: .topLeading)
                      .padding(.bottom)
                }
                
                Spacer()
                
                Text(user.name)
                  .font(
                    Font.custom("Old Standard TT", size: 24)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                  .frame(width: 275, height: 39, alignment: .topLeading)
                  .padding(.bottom)
                  .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 329, height: 120)
                        .background(.white)

                        .cornerRadius(10))
            }
            .padding(0)
            .frame(width: 329, height: 552, alignment: .bottom)
            .background(Color(red: 1, green: 0.96, blue: 0.96))
            .cornerRadius(11)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            
        }
        .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 161/255, green: 69/255, blue: 56/255))
    }
}

#Preview {
    BrandDescription(user: User.mockUsers[0])
}
