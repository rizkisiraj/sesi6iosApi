//
//  JokeVM.swift
//  Sesi6FirstAPI
//
//  Created by Rizki Siraj on 31/01/24.
//

import Foundation

class JokeVM: ObservableObject {
    @Published var jokesArray: [Joke]?
    @Published var joke: Joke?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchJoke(jokeType: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        do {
            let fetchedJoke = try await ApiService.shared.fetchJokeServices(jokeType: jokeType)
            DispatchQueue.main.async {
                self.joke = fetchedJoke
                self.isLoading = false
                print("Setup: \(self.joke?.setup ?? "No Setup")")
                print("Punchline: \(self.joke?.punchline ?? "No Punchline")")
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                print("ERROR: Could not get data from URL: \(Constant.jokeApi).\(error.localizedDescription)")
            }
        }
    }
    
    func fetchJokesArray(jokeType: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        do {
            let fetchedJoke = try await ApiService.shared.fetchJokeArray(jokeType: jokeType)
            DispatchQueue.main.async {
                self.jokesArray = fetchedJoke
                self.isLoading = false
                print("Setup: \(self.joke?.setup ?? "No Setup")")
                print("Punchline: \(self.joke?.punchline ?? "No Punchline")")
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                print("ERROR: Could not get data from URL: \(Constant.jokeApi).\(error.localizedDescription)")
            }
        }
    }
}
