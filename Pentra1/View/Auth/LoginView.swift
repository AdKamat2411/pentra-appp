//
//  LoginView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 09/10/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Spacer()
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 206, height: 86.07764)
                      .background(
                        Image("pentra2")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 206, height: 86.07763671875)
                          .clipped()
                      )
                      .padding(4)
                      
                    
                    
                    
                    Text("Login")
                        .font(Font.custom("Old Standard TT", size: 36))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 261, height: 55, alignment: .center)
                    
                    VStack {
                        HStack(alignment: .top) {
                            Image(systemName: "envelope")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.white))
                            
                            TextField("email", text: $viewModel.email, prompt: Text("Email")
                                .foregroundColor(.white))
                                .textInputAutocapitalization(.never)
                                .font(Font.custom("Old Standard TT", size: 18))
                                .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            
                        }
                        Divider()
                            .background(Color(.white))
                        
                        HStack(alignment: .top) {
                            Image(systemName: "lock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.white))
                            
                            SecureField("password", text: $viewModel.password, prompt: Text("Password")
                                .foregroundColor(.white))
                                .font(Font.custom("Old Standard TT", size: 18))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                        }
                        Divider()
                            .background(Color(.white))
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                    
                    Button {
                        Task {
                            try await viewModel.login()
                        }
                    } label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                    }
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                    
                    Spacer()
                    
                    NavigationLink {
                        RegisterView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(Font.custom("Old Standard TT", size: 18))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Text("Sign up")
                                .bold()
                                .font(Font.custom("Old Standard TT", size: 18))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                .padding(.bottom, 48)
                .foregroundColor(.blue)
                
                
                if $viewModel.isLoading.wrappedValue{
                    LoadingOverlayView()
                }
            }
            .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 161/255, green: 69/255, blue: 56/255))
            .alert(viewModel.errorEvent.content, isPresented: $viewModel.errorEvent.display) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
