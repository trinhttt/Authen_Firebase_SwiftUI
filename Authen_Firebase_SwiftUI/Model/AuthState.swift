//
//  AuthState.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/24/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import Foundation
import Firebase

class AuthState: NSObject, ObservableObject {
    @Published var isAuthenticating = false
    @Published var loggedinUser: User?
    
    static let shared = AuthState()
    
    private let auth = Auth.auth()
    
    override init() {
        loggedinUser = auth.currentUser
        super.init()
        auth.addStateDidChangeListener(authStateChanged)
    }
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedinUser else { return }
        loggedinUser = user
    }
    
    func login(email: String, password: String) {
        isAuthenticating = true
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            strongSelf.isAuthenticating = false

            guard let user = authResult?.user else {
                print(error?.localizedDescription)
                return 
            }
            strongSelf.loggedinUser = user
            print("Login success: \(user)")
          }

    }
    
    func signOut() {
        try? auth.signOut()
    }
    
}
