//
//  RegistrationCompletion.swift
//  TinderClone
//
//  Created by Aditya Kamat on 19/10/2023.
//

import SwiftUI

struct RegistrationCompletion: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                        Text("How Pentra Works")
                          .font(
                            Font.custom("Old Standard TT", size: 31)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)
                          .frame(width: 267, height: 39, alignment: .center)
                          .padding()
                        
                
                    Text("Every week, you get 10 applies to pick products you like. We notify brands, and sometimes, they’ll decide to gift and/or sponsor you!\n\nFor the products you really like, you get 3 SuperApplies every week (the star icon). SuperSwiping can increase your odds of getting a match by upto 3x.\n\nBrands can also directly message you without previous interaction. Look out for our notifications when that happens!")
                        .font(Font.custom("Old Standard TT", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .frame(width: 380, height: 380, alignment: .center)
        
                        Button {
                            Task {
                                try await viewModel.completeRegistrationFlow()
                            }
                        } label: {
                            Text("GOT IT")
                              .font(
                                Font.custom("Cabin-Regular", size: 15)
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
            if $viewModel.isLoading.wrappedValue {
                LoadingOverlayView()
            }
        }
    }
}

#Preview {
    RegistrationCompletion()
        .environmentObject(AuthViewModel())
}
