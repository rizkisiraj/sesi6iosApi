//
//  ApiService.swift
//  Sesi6FirstAPI
//
//  Created by Rizki Siraj on 31/01/24.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    private init() {
        
    }
    
    func fetchJokeServices(jokeType: String) async throws -> Joke {
        let urlString = URL(string: "\(Constant.jokeApi)/type/\(jokeType)/1")
        guard let url = urlString else {
            print("ERROR: Couldn't convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("We are accessing the URL \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...229).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let jokes = try JSONDecoder().decode([Joke].self, from: data)
        guard !jokes.isEmpty else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No joke found in the response"])
        }
        
        return jokes[0]
    }
    
    func fetchJokeArray(jokeType: String) async throws -> [Joke] {
        let urlString = URL(string: "\(Constant.jokeApi)/type/\(jokeType)")
        guard let url = urlString else {
            print("ERROR: Couldn't convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("We are accessing the URL \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...229).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let jokes = try JSONDecoder().decode([Joke].self, from: data)
        guard !jokes.isEmpty else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No joke found in the response"])
        }
        
        return jokes
    }

}
