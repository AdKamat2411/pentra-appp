//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by Aditya Kamat on 08/10/2023.
//
import SwiftUI
import Firebase

@main
struct TinderCloneApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
