//
//  AuthManager.swift
//  helpDB
//
//  Created by Jonathan Breaker on 5/9/25.
//

import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()

    func signInAnonymously(completion: @escaping (Bool) -> Void) {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("Firebase Auth Error: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Signed in anonymously: \(result?.user.uid ?? "Unknown UID")")
                completion(true)
            }
        }
    }

    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }

    func signOut() {
        try? Auth.auth().signOut()
    }
}
