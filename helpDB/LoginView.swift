//
//  LoginView.swift
//  helpDB
//
//  Created by Jonathan Breaker on 5/9/25.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoading = false
    @State private var showError = false
    var onLogin: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to FAMU Brons")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Image("rbLaunch")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()

            if isLoading {
                ProgressView()
                    .padding()
            } else {
                Button(action: handleLogin) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }

            if showError {
                Text("Login failed. Please try again.")
                    .foregroundColor(.red)
                    .padding(.top)
            }

            Spacer()
        }
    }

    func handleLogin() {
        isLoading = true
        AuthManager.shared.signInAnonymously { success in
            isLoading = false
            if success {
                onLogin()
            } else {
                showError = true
            }
        }
    }
}

