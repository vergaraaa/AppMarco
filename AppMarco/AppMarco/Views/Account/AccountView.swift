//
//  AccountView.swift
//  AppMarco
//
//  Created by user191983 on 9/23/21.
//

import SwiftUI

struct AccountView: View {
//    @Binding var name: String
    @EnvironmentObject var loginVM : LoginViewModel
    
    var body: some View {
        ZStack{
            Color("BgVeige")
            
            VStack{
                Text("Nombre: ")
//                    TextField("Nombre: ")
                
                Button(action: {
                    loginVM.logout()
                }, label: {
                    Text("Sign out")
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Image("LogoMarco")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                })
            })
            
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
