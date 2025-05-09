//
//  AppView.swift
//  helpDB
//
//  Created by Jonathan Breaker on 5/9/25.
//

import SwiftUI

struct AppView: View {
    @State private var isLoggedIn = AuthManager.shared.isSignedIn

    var body: some View {
        Group {
            if isLoggedIn {
                ContentView()
            } else {
                LoginView {
                    isLoggedIn = true
                }
            }
        }
        .animation(.easeInOut, value: isLoggedIn)
        .transition(.opacity)
    }
}


#Preview {
    AppView()
}

