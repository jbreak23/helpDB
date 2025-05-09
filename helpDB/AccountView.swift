//
//  AccountView.swift
//  helpDB
//
//  Created by Jonathan Breaker on 5/9/25.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    @State private var isLoggedOut = false
    @State private var showingLogoutAlert = false
    private let user = Auth.auth().currentUser

    var body: some View {
        VStack(spacing: 16) {
            if let photoURL = user?.photoURL {
                AsyncImage(url: photoURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }

            if let name = user?.displayName {
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
            }

            if let email = user?.email {
                Text(email)
                    .foregroundColor(.secondary)
            } else if let uid = user?.uid {
                Text("User ID: \(uid)")
                    .foregroundColor(.secondary)
            }

            Divider()

            Button(action: {
                showingLogoutAlert = true
            }) {
                Text("Log Out")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .alert("Are you sure you want to log out?", isPresented: $showingLogoutAlert) {
                Button("Log Out", role: .destructive, action: handleLogout)
                Button("Cancel", role: .cancel) {}
            }

            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $isLoggedOut) {
            LoginView {
                isLoggedOut = false
            }
        }
    }

    func handleLogout() {
        AuthManager.shared.signOut()
        isLoggedOut = true
    }
}




#Preview {
    AccountView()
}
