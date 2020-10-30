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
    @Published var error: Error?
    
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
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    func signOut() {
        try? auth.signOut()
    }
    
    func signup(email: String, password: String, passwordConfirm: String) {
        guard password == passwordConfirm else {
            self.error = NSError(domain: "", code: 9000, userInfo: [NSLocalizedDescriptionKey: "Password and confirmation does not match"])
            error?.localizedDescription
            return
        }
        
        isAuthenticating = true
        error = nil
        auth.createUser(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    func handleAuthResultCompletion(result: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
            
            guard let user = result?.user else {
                print(error?.localizedDescription)
                return
            }
            self.loggedinUser = user
            print("Auth success: \(user)")
        }
    }
}


