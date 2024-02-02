//
//  ViewCoordinator.swift
//  Sesi6FirstAPI
//
//  Created by Hidayat Abisena on 28/01/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                    CardView()
            } else {
                SplashScreen(isActive: $isActive)
            }
        }
    }
}

#Preview {
    ViewCoordinator()
}
