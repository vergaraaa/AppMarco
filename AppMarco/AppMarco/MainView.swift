//
//  ContentView.swift
//  AppMarco
//
//  Created by user191983 on 8/29/21.
//

import SwiftUI

struct MainView: View {
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
            
            Text("Expos")
                .tabItem {
                    let menuText = Text("Expos", comment: "Expos")
                    Label{
                        menuText
                    } icon: {
                        Image(systemName: "photo")
                    }
                }
            
            Text("Boletos")
                .tabItem {
                    let menuText = Text("Boletos", comment: "Boletos")
                    Label{
                        menuText
                    } icon: {
                        Image(systemName: "ticket")
                    }
                }
            
            Text("Tienda")
                .tabItem {
                    let menuText = Text("Tienda", comment: "Tienda")
                    Label{
                        menuText
                    } icon: {
                        Image(systemName: "cart")
                    }
                }
            
            Text("Marco")
                .tabItem {
                    let menuText = Text("Marco", comment: "Marco")
                    Label{
                        menuText
                    } icon: {
                        Image(systemName: "square")
                    }
                }
        }
        .accentColor(Color("RosaMarco"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
