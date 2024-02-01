//
//  AuthService.swift
//  TinderClone
//
//  Created by Aditya Kamat on 09/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isLoading = false
    @Published var errorEvent = TinderError(content: "", display: false)
    
    @Published var signupFlowActive = false
    
    
    init() {
        Task {
            try await fetchUser()
        }
    }
    
    @MainActor
    func register(withEmail email: String, name: String, password: String, onComplete: () -> ()) async {
        isLoading = true
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let uid = result.user.uid
            let user = User(id: uid, email: email, name: name)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else {
                isLoading = false
                return
            }
            
            try await Firestore.firestore().collection(COLLECTION_USER).document(user.id).setData(encodedUser)
            self.currentUser = user
            signupFlowActive = true
            onComplete()
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
            errorEvent = TinderError(content: error.localizedDescription)
            signout()
        }
        isLoading = false
    }
    
    func signout() {
        userSession = nil
        currentUser = nil
        try? Auth.auth().signOut()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async {
        isLoading = true
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await fetchUser()
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
            errorEvent = TinderError(content: error.localizedDescription)
            signout()
        }
        isLoading = false
    }
    
    @MainActor
    func fetchUser() async throws{
        userSession = Auth.auth().currentUser
        guard let uid = self.userSession?.uid else { return }
        currentUser = try await UserService.fetchUser(withUID: uid)
    }
    
    @MainActor
    func completeRegistrattionFlow(PostMedium: Set<String>, PersonalBrand: Set<String>, country: String, best_email: String, rates: String, ref: String, house: String, ig: String, tiktok: String, yt: String, bio: String) async {
        guard let currentUser = currentUser else { return }
        isLoading = true
        
        do {
            let data = [
                "PostMedium": Array(PostMedium),
                "PersonalBrand": Array(PersonalBrand),
                "country": country,
                "best_email": best_email,
                "rates": rates,
                "ref": ref,
                "house": house,
                "ig": ig,
                "tiktok": tiktok,
                "yt": yt,
                "bio": bio
            ] as [String: Any]
            
            try await Firestore.firestore().collection(COLLECTION_USER).document(currentUser.id).updateData(data)
            
            try await fetchUser()
        } catch {
            print("DEBUG: Failed to set data with error \(error.localizedDescription)")
            errorEvent = TinderError(content: error.localizedDescription)
        }
        
        isLoading = false
        signupFlowActive = false
    }
}
