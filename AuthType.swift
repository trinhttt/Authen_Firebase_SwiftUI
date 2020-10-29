//
//  AuthType.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/29/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import Foundation

enum AuthType: String {
    case login
    case signup
    
    var text: String {
        rawValue.capitalized
    }
    
    var footerText: String {
        switch self {
        case .login:
            return "Not a member, signup"
        case .signup:
            return "Aldready a member? login"
        }
    }
}
