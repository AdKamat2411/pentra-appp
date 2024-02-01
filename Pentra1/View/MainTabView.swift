//
//  MainTabView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 19/10/2023.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedIndex = 1
    
    // Custom tab item view
    // Custom tab item view
    // Custom tab item view
    // Custom tab item view
    // Custom tab item view
    private func tabItem(imageName: String, tag: Int) -> some View {
        ZStack {
            // This is your background image when the tab is selected
            if selectedIndex == tag {
                Image("selected"+imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                 // You can adjust the frame size as needed
            }
        
            // This is your icon image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
        }
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
                    ProfileView(user: user)
                        .tabItem {
                            tabItem(imageName: "person1", tag: 0)
                        }
                        .tag(0)
                    
                    SwipeView()
                        .tabItem {
                            tabItem(imageName: "flame", tag: 1)
                        }
                        .tag(1)
                    
                    MatchView()
                        .tabItem {
                            tabItem(imageName: "chat", tag: 2)
                        }
                        .tag(2)
                }
                .onAppear {
                    // The first tab will be selected initially
                    selectedIndex = 1
                }
        }
    }



#Preview {
    MainTabView(user: User.mockUsers[0])
}
