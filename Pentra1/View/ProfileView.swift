//
//  ProfileView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 19/10/2023.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    var user: User
    
    var body: some View {
        VStack {
            if let imageUrl = user.profileImageUrl {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 200, height: 200)
                  .background(
                    KFImage(URL(string: imageUrl))
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 200, height: 200)
                      .clipped()
                  )
                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                  .cornerRadius(173)
            } else {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 300, height: 300)
                  .background(
                    Image(systemName: "person.fill")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 171, height: 173)
                      .clipped()
                  )
                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                  .cornerRadius(173)
            }
            
            Text(user.name)
              .font(
                Font.custom("Old Standard TT", size: 32)
                  .weight(.bold)
              )
              .foregroundColor(Color(red: 1, green: 0.93, blue: 0.93))
              .frame(width: 300, height: 39, alignment: .center)
              .padding(.bottom, 80)
            
            Text("got influencer friends?")
              .font(
                Font.custom("Old Standard TT", size: 22)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 1, green: 0.93, blue: 0.93))
              .frame(width: 242, height: 39, alignment: .top)
            
            Text("referral code - zon1256")
              .font(Font.custom("Cabin", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.28, green: 0.25, blue: 0.25))
              .frame(width: 194, height: 36, alignment: .center)
              .foregroundColor(.clear)
              .frame(width: 260, height: 53)
              .background(Color(red: 1, green: 0.83, blue: 0.83))

              .cornerRadius(30)
            
        }
        .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 161/255, green: 69/255, blue: 56/255))
    }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
