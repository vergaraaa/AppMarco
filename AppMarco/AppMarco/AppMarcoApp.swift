//
//  AppMarcoApp.swift
//  AppMarco
//
//  Created by user191983 on 8/29/21.
//

import SwiftUI

@main
struct AppMarcoApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var loginVM = LoginViewModel()
    @StateObject var reservaVM = ReservaViewModel()
    var body: some Scene {
        WindowGroup {
            if(loginVM.isLogged){
                MainView()
                    .environmentObject(loginVM)
                    .environmentObject(reservaVM)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            else{
                LoginView()
                    .environmentObject(loginVM)
                
            }
        }
    }
}
