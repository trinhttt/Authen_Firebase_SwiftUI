//
//  AuthForm.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/24/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct AuthForm: View {
    @EnvironmentObject var authState: AuthState
    @State var email: String = ""
    @State var password: String = ""
    @State var isOn: Bool = false
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
            
            if isOn {
                TextField("Password", text: $password)
                    .textContentType(.password)
                    .autocapitalization(.none)
            } else {
                SecureField("Password", text: $password)
            }
            Toggle("Show pass", isOn: $isOn)
            
            Button("Login") {
                self.login()
            }.disabled(email.isEmpty || password.isEmpty)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(30)
    }
    
    private func login() {
        authState.login(email: email, password: password)
    }
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        AuthForm()
    }
}
