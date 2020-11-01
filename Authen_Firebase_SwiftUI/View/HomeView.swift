//
//  HomeView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/25/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authState: AuthState
    @State var isLoading: Bool = false
    @State var error: Error?
//    @ObservedObject var viewModel = ViewModel()
    @State var isShowingToDo: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if let url = URL(string: "https://apple.com") {
                    WebView(isLoading: $isLoading, error: $error, url: url)
//                    WebView(viewModel: viewModel, url: url)
                } else {
                    Text("HomeView").font(.callout)
                }
                
                if self.isLoading {
                    ActivityIndicator()
                } else if let error = self.error {
                    Text(error.localizedDescription)
                }
            }
            .sheet(isPresented: $isShowingToDo) {
                ToDoList()
            }
            .background(Color.yellow)
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(trailing:
                                    HStack {
                                        Button(action: gotoToDoView, label: {
                                            Image(systemName: "square.and.pencil")
                                            Text("ToDo")
                                        })
                                        Button(action: signoutTapped, label: {
                                            Image(systemName: "person.circle")
                                            Text("Logout")
                                        })
                                    })
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
    
    private func signoutTapped() {
        authState.signOut()
    }
    
    private func gotoToDoView() {
        isShowingToDo = true
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
