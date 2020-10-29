//
//  SignupView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/25/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @EnvironmentObject var authState: AuthState
    @State var authType = AuthType.login
    
    var body: some View {
        ZStack {
            VStack {
                Text("Authencation")
                    .fontWeight(.bold)
                    .font(.headline)
                if authState.isAuthenticating {
                    ActivityIndicator()
//                    if #available(iOS 14.0, *) {
//                        ProgressView()
//                    } else {
//                        // Fallback on earlier versions
//                    }
                } else {
                    AuthForm(authType: $authType)
                }
            }
        }
    }
}
