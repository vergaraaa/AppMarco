//
//  SignUpView.swift
//  AppMarco
//
//  Created by user191983 on 10/4/21.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var loginVM : LoginViewModel
    
    var body: some View {

        VStack {
            TextField("Nombre(s): ", text: $loginVM.name)
            TextField("Apellido(s): ", text: $loginVM.lastname)
            TextField("Email", text: $loginVM.email)
            SecureField("Password", text: $loginVM.password)
            
            Button(action: {
                loginVM.signup()
            }, label: {
                Text("Registrar")
            })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
