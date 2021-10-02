//
//  AppMarcoApp.swift
//  AppMarco
//
//  Created by user191983 on 8/29/21.
//

import SwiftUI

@main
struct AppMarcoApp: App {
    
    @StateObject var loginVM = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            if(loginVM.isLogged){
                MainView()
            }
            else{
                LoginView()
                    .environmentObject(loginVM)
            }
        }
    }
}
