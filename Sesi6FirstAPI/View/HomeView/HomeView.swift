//
//  HomeView.swift
//  Sesi6FirstAPI
//
//  Created by Rizki Siraj on 02/02/24.
//

import SwiftUI

struct HomeView: View {
    var jokeTypes = ["general", "knock-knock", "programming", "anime", "food", "dad"]
    @StateObject private var jokeVM = JokeVM()
    @State private var jokeTypeSelection = "knock-knock"
    
    var body: some View {
        NavigationStack {
            VStack {
                if jokeTypeSelection == "knock-knock" {
                    ScrollView(.horizontal) {
                        HStack() {
                            ForEach(jokeVM.jokesArray ?? [], id: \.id) { joke in
                                ZStack {
                                    CardView(joke: joke)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.leading)
                        .task {
                            await jokeVM.fetchJokesArray(jokeType: jokeTypeSelection)
                        }
                    }
                } else {
                    CardView(joke: jokeVM.joke)
                        .task {
                            await jokeVM.fetchJoke(jokeType: jokeTypeSelection)
                        }
                }
                
                
                Spacer()
                
                Picker("Please choose joke type",     selection: $jokeTypeSelection) {
                        ForEach(jokeTypes, id: \.self) {
                            Text($0)
                        }
                }
            }
            .navigationTitle("Swift Jokes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                        Task {
                            if jokeTypeSelection == "knock-knock" {
                                await jokeVM.fetchJokesArray(jokeType: "knock-knock")
                            } else {
                                await jokeVM.fetchJoke(jokeType: jokeTypeSelection)
                            }
                        }
                    } label: {
                        Image(systemName:"arrow.clockwise")
                    }
                }
        }
        }
    }
}

#Preview {
    HomeView()
}
