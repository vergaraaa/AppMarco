//
//  WebView.swift
//  App05-Entrenimiento
//
//  Created by Elvia Rosas on 02/09/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let html: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }


    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: html)!))
        uiView.allowsBackForwardNavigationGestures = false
    }
}
