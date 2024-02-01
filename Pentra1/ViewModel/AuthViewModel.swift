//
//  AuthViewModel.swift
//  TinderClone
//
//  Created by Aditya Kamat on 09/10/2023.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI


@MainActor
class AuthViewModel: ObservableObject {
    private var auth = AuthService.shared
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var isLoading = AuthService.shared.isLoading
    private var cancellables = Set<AnyCancellable> ()
    @Published var errorEvent = AuthService.shared.errorEvent
    @Published var currentUser = AuthService.shared.currentUser
    @Published var PostMedium: Set<String> = []
    @Published var PersonalBrand: Set<String> = []
    @Published var gender = "influencer"
    @Published var preference = "brand"
    @Published var country = "United States"
    @Published var best_email = ""
    @Published var rates = ""
    @Published var ref = ""
    @Published var house = ""
    @Published var ig = ""
    @Published var tiktok = ""
    @Published var yt = ""
    @Published var bio = ""
    @Published var profileImageUrl = ""
    @Published var showError: Bool = false  // This tracks whether to show the error message
    
    @Published var signupFlowActive = AuthService.shared.signupFlowActive
    
    func validateText() {
            showError = house.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    
    init() {
        auth.signout()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        auth.$isLoading.sink { [weak self] isLoading in
            self?.isLoading = isLoading
        }
        .store(in: &cancellables)
        
        auth.$errorEvent.sink { [weak self] errorEvent in
            self?.errorEvent = errorEvent
        }
        .store(in: &cancellables)
        
        auth.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        
        auth.$signupFlowActive.sink { [weak self] signupFlowActive in
            self?.signupFlowActive = signupFlowActive
        }
        .store(in: &cancellables)
    }
    
    func register(onComplete: () -> ()) async throws {
        await auth.register(withEmail: email, name: name, password: password, onComplete: onComplete)
        //resetting data fields on registration page
        email = ""
        password = ""
        name = ""
        
    }
    
    func login() async throws {
        await auth.login(withEmail: email, password: password)
        email = ""
        password = ""
    }
    
    func skipRegistrationFlow() {
        signupFlowActive = false
    }
    
    func completeRegistrationFlow() async throws {
        await auth.completeRegistrattionFlow(PostMedium: PostMedium, PersonalBrand: PersonalBrand, country: country, best_email: best_email, rates: rates, ref: ref, house: house, ig: ig, tiktok: tiktok, yt: yt, bio: bio)
        
        email = ""
        password = ""
        name = ""
        PostMedium = []
        PersonalBrand = []
        country = "United States"
        best_email = ""
        rates = ""
        ref = ""
        house = ""
        ig = ""
        tiktok = ""
        yt = ""
        bio = ""
    }
}
