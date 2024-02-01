//
//  FinalStep.swift
//  TinderClone
//
//  Created by Aditya Kamat on 18/10/2023.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct FinalStep: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    
    func getCountries() -> [String] {
        var countries: [String] = []

        for code in NSLocale.isoCountryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }

        return countries
    }
    
    

    var body: some View {
        VStack(spacing: 0) {
            Text("Final Step")
              .font(Font.custom("OldStandardTT-Bold", size: 36))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 267, height: 39, alignment: .center)
            
            Text("My personal brand is about:")
              .font(Font.custom("OldStandardTT-Regular", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            VStack(spacing: 20) {
                ForEach(Array(PersonalBrand.allCases).chunked(into: 2), id: \.self) { rowItems in
                    HStack(spacing: 20) {
                        ForEach(rowItems, id: \.self) { item in
                            let selected = viewModel.PersonalBrand.contains(item.rawValue)
                            ZStack {
                                RoundedRectangle(cornerRadius: 26.5)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 1, green: 0.98, blue: 0.98), lineWidth: 1)
                                    .fill(selected ? Color(red: 1, green: 0.98, blue: 0.98) : .clear)
                                
                                Text(String(describing: item.rawValue))
                                    .font(Font.custom("Cabin-Regular", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(selected ? .black : .white)
                                    
                            }
                            .frame(width: 148.33333, height: 53)
                            .onTapGesture {
                                if selected {
                                    viewModel.PersonalBrand.remove(item.rawValue)
                                } else {
                                    viewModel.PersonalBrand.insert(item.rawValue)
                                }
                            }
                        }
                    }
                }
            }
            
            
            Text("My address (seen only by brands that you approve):")
              .font(Font.custom("Old Standard TT", size: 18))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 331, height: 55, alignment: .center)
            
            
            
            ZStack {RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                                .frame(width: 275, height: 171)

                            TextEditor(text: $viewModel.house)
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
            
            Text("Please enter your country:")
                          .font(Font.custom("Old Standard TT", size: 18))
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)
                          .frame(width: 331, height: 55, alignment: .center)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                    .frame(width: 275, height: 43)

                TextField("Country", text: $viewModel.country)
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
            
            
            Text("Got a referral code? (optional)")
                          .font(Font.custom("Old Standard TT", size: 18))
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)
                          .frame(width: 331, height: 55, alignment: .center)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 161/255, green: 69/255, blue: 56/255)) // Change the color here
                                .frame(width: 275, height: 43)

                            TextField("", text: $viewModel.ref)
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
                RegistrationCompletion()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("DONE")
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
    }
}


#Preview {
    FinalStep()
        .environmentObject(AuthViewModel())
}



