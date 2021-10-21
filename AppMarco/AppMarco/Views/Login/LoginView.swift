//
//  LoginView.swift
//  AppMarco
//
//  Created by user191983 on 9/3/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var loginVM : LoginViewModel
    @State var showSignUp : Bool = false
    
    var body: some View {
        
        ZStack{
            Color("RosaMarco")
                .ignoresSafeArea()
            
            VStack {
                Image("LogoMarco")
                    .resizable()
                    .scaledToFit()
                    .frame(height:50)
                
                Text("#MuseoDeTodos")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                TextField("Usuario", text: $loginVM.email)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .accentColor(.black)
                
                SecureField("Contraseña", text: $loginVM.password)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .accentColor(.black)
                
                VStack{
                    
                    Button(action: {
                        loginVM.login()
                        
                    }, label: {
                        Text("Iniciar Sesión")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 25)
                            
                    })
                    .alert(isPresented: $loginVM.shortAlertLoginFail) {
                        Alert(title: Text("Correo/Contrasena incorrectos"))
                    }
                    //.padding(35)
                    
                    Button(action: {
                        self.showSignUp.toggle()
                    }, label: {
                        Text("Registrar")
                            .bold()
                            .padding(5)
                            .foregroundColor(.white)
            
                    })
                    .sheet(isPresented: $showSignUp, content: {
                        SignUpView()
                    })
                }
//                NavigationLink(
//                    destination: MainView(),
//                    label: {
//                        Text("Iniciar Sesión")
//                            .padding(.vertical, 10.0)
//                            .padding(.horizontal, 25.0)
//                            .clipShape(Capsule())
//                            //.foregroundColor(Color("RosaMarco"))
//                            .background(Color(.white))
//                            .cornerRadius(15)
//                    })
//                    .padding()
//
//                NavigationLink(
//                    destination: MainView(),
//                    label: {
//                        Text("Continuar como invitado")
//                            .underline()
//                            .foregroundColor(Color(.white))
//                            .font(.subheadline)
//                    })
//                    .padding()
            } // VStack
            .padding()
        }// ZStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
