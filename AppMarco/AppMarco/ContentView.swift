//
//  ContentView.swift
//  AppMarco
//
//  Created by user191983 on 8/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Home")
                .tabItem {
                    let menuText = Text("Home", comment: "Home")
                    Label{
                        menuText
                    } icon: {
                        Image(systemName: "house")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
