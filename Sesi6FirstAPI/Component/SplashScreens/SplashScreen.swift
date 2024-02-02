//
//  SplashScreen.swift
//  Sesi6FirstAPI
//
//  Created by Hidayat Abisena on 28/01/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            Image(.launchScreen)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                Image(.logoSwiftOutlined)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Swift Jokes")
                    .font(.custom("PermanentMarker-Regular", size: 44))
                    .foregroundStyle(.white)
            }
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.easeIn(duration: 0.7).repeatForever(autoreverses: true)) {
                    self.scale = 0.9
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    @State var isActive = true
    return SplashScreen(isActive: $isActive)
}
