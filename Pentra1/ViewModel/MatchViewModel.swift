//
//  MatchViewModel.swift
//  TinderClone
//
//  Created by Aditya Kamat on 25/10/2023.
//

import Foundation
import Combine

class MatchViewModel: ObservableObject {
    var currentUser: User?
    private var cancellables = Set <AnyCancellable> ()
    @Published var matches: [Chat] = []
    var isLoading = false
    
    init() {
        setupSubscribers()
        Task {
            await fetchMatches()
        }
    }
    
    func setupSubscribers() {
        AuthService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
    
    @MainActor
    private func fetchMatches() {
        if let currentUser = currentUser {
            isLoading = true
            MatchService.fetchMatches(userId: currentUser.id) { chats in
                self.matches = chats
                self.isLoading = false
            }
        }
    }
}
