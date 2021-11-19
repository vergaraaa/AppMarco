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

        VStack(spacing: 35) {
            
            VStack(spacing: 15) {
                TextField("Nombre(s): ", text: $loginVM.name)
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .background(Color.black.opacity(0.05))
                    
                
                TextField("Apellido(s): ", text: $loginVM.lastname)
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .background(Color.black.opacity(0.05))
                
                TextField("Email", text: $loginVM.email)
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .background(Color.black.opacity(0.05))
                
                SecureField("Password", text: $loginVM.password)
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    .background(Color.black.opacity(0.05))
            }
            .foregroundColor(.black)
            .accentColor(.black)
            
            Button(action: {
                loginVM.signup()
            }, label: {
                Text("Registrar")
                    .bold()
                    .padding()
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .background(Color("RosaMarco"))
                    .cornerRadius(25)
                    .frame(width: 200, height: 50, alignment: .center)            })
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(15)
        //.foregroundColor(.black)
        //.accentColor(.black)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
