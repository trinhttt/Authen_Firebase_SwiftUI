//
//  WebView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/25/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI
import WebKit

//class ViewModel: ObservableObject {
//    @Published var isLoading: Bool = false
//    @Published var error: Error? = nil
//    
//}

struct WebView: UIViewRepresentable {
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
//    @ObservableObject var viewModel: ViewModel
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isLoading: $isLoading, error: $error)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var isLoading: Bool
        @Binding var error: Error?

        
        init(isLoading: Binding<Bool>, error: Binding<Error?>) {
            self._error = error
            self._isLoading = isLoading
            super.init()
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            isLoading = true
            error = nil
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            isLoading = false
            self.error = error
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            isLoading = false
        }
    }
}