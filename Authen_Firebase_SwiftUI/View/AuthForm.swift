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
    @State var passwordConfirm: String = ""
    @State var isOn: Bool = false
    @Binding var authType: AuthType
    
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
            
            if authType == .signup {
                if isOn {
                    TextField("Password Confirm", text: $passwordConfirm)
                        .textContentType(.password)
                        .autocapitalization(.none)
                } else {
                    SecureField("Password Confirm", text: $passwordConfirm)
                }
            }
            
            Toggle("Show pass", isOn: $isOn)
            
            Button(authType.text) {
                self.login()
            }.disabled(email.isEmpty || password.isEmpty)
            
            Button(action: footerButtonTapped) {
                Text(authType.footerText)
                    .font(.callout)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(30)
    }
    
    private func login() {
        authState.login(email: email, password: password)
    }
    
    private func footerButtonTapped() {
        clearFormField()
        authType = authType == .signup ? .login : .signup
    }
    
    private func clearFormField() {
        email = ""
        password = ""
        passwordConfirm = ""
        isOn = false
    }
}

//struct AuthForm_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthForm()
//    }
//}
