//  RegisterImageView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 11/10/2023.
//

import SwiftUI
import PhotosUI
import UIKit
import Combine

let mainScreen = UIScreen.main
let screenSize = mainScreen.bounds.size

struct RegisterImageView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingSponsors = false
    
    
    var body: some View {
        
        if showingSponsors{
            Sponsors()
        } else {
            VStack {
                Text("Preferences")
                    .font(Font.custom("OldStandardTT-Bold",size: 44))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 267, height: 39, alignment: .center)
                  
                Text("I’m mainly looking for:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 267, height: 55, alignment: .center)
                
                HStack {
                    Button {
                        showingSponsors = false
                    } label :{
                        Text("FREE GIFTS")
                          .font(Font.custom("Cabin", size: 15))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.28, green: 0.25, blue: 0.25))
                          .frame(width: 178, height: 28, alignment: .center)//Gifts
                        .foregroundColor(.clear)
                        .frame(width: 148.33333, height: 53)
                        .background(Color(red: 1, green: 0.98, blue: 0.98))
                        .cornerRadius(26.5)
                    }
                    
                    Button {
                        showingSponsors = true
                    } label :{
                        Text("SPONSORS")
                            .font(Font.custom("Cabin", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.98, blue: 0.98))

                            .frame(width: 178, height: 28, alignment: .center)
                            .foregroundColor(.clear)
                            .frame(width: 148.33333, height: 53)
                            .background(Color(red: 0.69, green: 0.28, blue: 0.26))

                            .cornerRadius(26.5)
                            .overlay(
                            RoundedRectangle(cornerRadius: 26.5)
                            .inset(by: 0.5)
                            .stroke(Color(red: 1, green: 0.98, blue: 0.98), lineWidth: 1))
                    }
                    
                }
                
                
                Text("For a gift I choose to receive, I will post:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 331, height: 55, alignment: .center)
                
                let gridItems: [GridItem] = [
                    .init(.flexible(), spacing: 0),
                    .init(.flexible(), spacing: 0)
                ]
                
                LazyVGrid(columns: gridItems, spacing: 20){
                    ForEach(PostMedium.allCases, id: \.self) { item in
                        let selected = viewModel.PostMedium.contains(item.rawValue)
                        ZStack {
                            RoundedRectangle(cornerRadius: 26.5)
                                .inset(by: 0.5)
                                .stroke(Color(red: 1, green: 0.98, blue: 0.98), lineWidth: 1)
                                .fill(selected ? Color(red: 1, green: 0.98, blue: 0.98) : .clear)
                            
                            Text(String(describing: item.rawValue))
                                .font(Font.custom("Cabin", size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundColor(selected ? .black : .white)
                        }
                        .frame(width: 148.33333, height: 53)
                        .onTapGesture {
                            if selected {
                                viewModel.PostMedium.remove(item.rawValue)
                            } else {
                                viewModel.PostMedium.insert(item.rawValue)
                            }
                        }
                    }
                }
                
                Text("My best email address:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 331, height: 55, alignment: .center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                        .frame(width: 275, height: 43)

                    TextField("", text: $viewModel.best_email)
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
                    Social()
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
}

struct Sponsors: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingSponsors = true
    
    var body: some View {
        
        if showingSponsors {
            VStack {
                Text("Preferences")
                  .font(Font.custom("OldStandardTT-Bold", size: 44))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 267, height: 39, alignment: .center)
                  
                
                Text("I’m mainly looking for:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 267, height: 55, alignment: .center)
                
                HStack {
                    Button {
                        showingSponsors = false
                    } label :{
                        Text("FREE GIFTS")
                            .font(Font.custom("Cabin", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.98, blue: 0.98))

                            .frame(width: 178, height: 28, alignment: .center)
                            .foregroundColor(.clear)
                            .frame(width: 148.33333, height: 53)
                            .background(Color(red: 0.69, green: 0.28, blue: 0.26))

                            .cornerRadius(26.5)
                            .overlay(
                            RoundedRectangle(cornerRadius: 26.5)
                            .inset(by: 0.5)
                            .stroke(Color(red: 1, green: 0.98, blue: 0.98), lineWidth: 1))
                    }
                    
                    Button {
                        showingSponsors = true
                    } label :{
                        Text("SPONSORS")
                          .font(Font.custom("Cabin", size: 15))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.28, green: 0.25, blue: 0.25))
                          .frame(width: 178, height: 28, alignment: .center)//Gifts
                        .foregroundColor(.clear)
                        .frame(width: 148.33333, height: 53)
                        .background(Color(red: 1, green: 0.98, blue: 0.98))
                        .cornerRadius(26.5)
                    }
                    
                }
                
                
                Text("My rates for all platforms are:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 331, height: 55, alignment: .center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                        .frame(width: 275, height: 171)

                    TextEditor(text: $viewModel.rates)
                        .scrollContentBackground(.hidden)
                        .foregroundColor(.white)
                        .frame(width: 275, height: 171)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0))
                        .padding(.leading)
                        .cornerRadius(10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.white.opacity(0.44), lineWidth: 1)

                        )
                }

                
                Text("My best email address:")
                  .font(Font.custom("Old Standard TT", size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 331, height: 55, alignment: .center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                        .frame(width: 275, height: 43)

                    TextField("", text: $viewModel.best_email)
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
                    Social()
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
        } else {
            RegisterImageView()
        }
    }
}

#Preview {
    RegisterImageView()
        .environmentObject(AuthViewModel())
}

