//
//  HomeView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/25/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isLoading: Bool = false
    @State var error: Error?
    
    var body: some View {
        NavigationView {
            ZStack {
                if let url = URL(string: "https://apple.com") {
                    WebView(isLoading: $isLoading, error: $error, url: url)
                } else {
                    Text("HOmeView").font(.callout)
                }
                
                if isLoading {
                    ActivityIndicator()
                } else if let error = error {
                    Text(error.localizedDescription)
                }
            }
            
        }.background(Color.yellow)
        .navigationBarTitle("Home", displayMode: .inline)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
