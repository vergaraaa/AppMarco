//
//  ContentView.swift
//  AppMarco
//
//  Created by user191983 on 8/29/21.
//

import SwiftUI

struct MainView: View {
    
    enum Tab{
        case home
        case expos
        case boletos
        case tienda
        case marco
    }
    
    @State private var selection: Tab = .home
    
    init(){
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarApperance
    }
    
    var body: some View {
        TabView(selection: $selection){
            
            NavigationView{
                HomeView()
            }
            .tabItem {
                let menuText = Text("Home", comment: "Home")
                Label{
                    menuText
                } icon: {
                    Image(systemName: "house")
                }
            }
            .tag(Tab.home)
            .navigationBarTitleDisplayMode(.inline)
            .navigationAppearance(backgroundColor: UIColor(Color("RosaMarco")), foregroundColor: .white, tintColor: UIColor(.white), hideSeparator: true)
            .navigationBarHidden(true)
            
            NavigationView{
                ExposView()
            }
            .tabItem {
                let menuText = Text("Expos", comment: "Expos")
                Label{
                    menuText
                } icon: {
                    Image(systemName: "photo")
                }
            }
            .tag(Tab.expos)
            .navigationAppearance(backgroundColor: UIColor(Color("RosaMarco")), foregroundColor: .white, tintColor: UIColor(.white), hideSeparator: true)
            .navigationBarHidden(true)
            
            NavigationView{
                BoletosView()
            }
            .tabItem {
                let menuText = Text("Boletos", comment: "Boletos")
                Label{
                    menuText
                } icon: {
                    Image(systemName: "ticket")
                }
            }
            .tag(Tab.boletos)
            .navigationAppearance(backgroundColor: UIColor(Color("RosaMarco")), foregroundColor: .white, tintColor: UIColor(.white), hideSeparator: true)
            .navigationBarHidden(true)
            
            NavigationView{
                TiendaView()
            }
            .tabItem {
                let menuText = Text("Tienda", comment: "Tienda")
                Label{
                    menuText
                } icon: {
                    Image(systemName: "cart")
                }
            }
            .tag(Tab.tienda)
            .navigationAppearance(backgroundColor: UIColor(Color("RosaMarco")), foregroundColor: .white, tintColor: UIColor(.white), hideSeparator: true)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            NavigationView{
                AccountView()
            }
            .tabItem {
                let menuText = Text("Marco", comment: "Marco")
                Label{
                    menuText
                } icon: {
                    Image(systemName: "square")
                }
            }
            .tag(Tab.marco)
            .navigationAppearance(backgroundColor: UIColor(Color("RosaMarco")), foregroundColor: .white, tintColor: UIColor(.white), hideSeparator: true)
            .navigationBarHidden(true)
        }
        //.accentColor(Color("RosaMarco"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
