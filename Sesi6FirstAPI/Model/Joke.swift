//
//  Joke.swift
//  Sesi6FirstAPI
//
//  Created by Rizki Siraj on 31/01/24.
//

import Foundation

struct Joke: Codable, Identifiable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}
