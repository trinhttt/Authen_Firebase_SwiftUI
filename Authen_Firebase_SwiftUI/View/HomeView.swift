//
//  HomeView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/25/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("HOmeView")
                .font(.callout)
        }.background(Color.yellow)
        .navigationBarTitle("Home", displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
