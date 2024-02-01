//
//  ContentView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 08/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.currentUser == nil || viewModel.signupFlowActive {
            LoginView()
        } else {
            if let user = viewModel.currentUser {
                MainTabView(user: user)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
