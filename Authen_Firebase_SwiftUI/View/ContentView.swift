//
//  ContentView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/24/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthState
    var body: some View {
        Group {
            if authState.loggedinUser != nil {
                HomeView()
            } else {
                SignupView()
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
