//
//  ContentView.swift
//  Sesi6FirstAPI
//
//  Created by Hidayat Abisena on 28/01/24.
//

import SwiftUI

struct CardView: View {
    var joke: Joke?
    @State private var isShowing = false
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    
    var body: some View {
                ZStack {
                        VStack {
                            Text("Setup:")
                                .foregroundStyle(.white)
                                .font(.custom("PermanentMarker-Regular", size: 30))
                            
                            Text(joke?.setup ?? Constant.DefaultValue.noJokes)
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                                .italic()
                        }
                        .offset(y: moveDownward ? -218 : -300)
                        
                        Text(joke?.punchline != nil && isShowing ? joke!.punchline : "...")
                            .foregroundStyle(.white)
                            .font(.custom("PermanentMarker-Regular", size: 35))
                            .multilineTextAlignment(.center)
                        
                        Button {
                           playSingleSound(sound: "sound-chime", type: "mp3")
                            isShowing = true
                        } label: {
                            HStack {
                                Text("Punchline".uppercased())
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                                
                                Image(systemName: "arrow.right.circle")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical)
                            .padding(.horizontal, 24)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.color07, Color.color08]), startPoint: .leading, endPoint: .trailing)
                            )
                            .clipShape(Capsule())
                            .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                        }
                        .offset(y: moveUpward ? 210 : 300)
                        
                    }
                    .frame(width: 335, height: 545)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.color07, Color.color08]), startPoint: .top, endPoint: .bottom)
                    )
                    .opacity(fadeIn ? 1.0 : 0.0)
                    .onAppear() {
                      withAnimation(.linear(duration: 1.2)) {
                        self.fadeIn.toggle()
                      }
                        
                      withAnimation(.linear(duration: 0.6)) {
                        self.moveDownward.toggle()
                        self.moveUpward.toggle()
                      }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
    }
}

#Preview {
    CardView()
}
