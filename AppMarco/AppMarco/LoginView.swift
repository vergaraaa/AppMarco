//
//  LoginView.swift
//  AppMarco
//
//  Created by user191983 on 9/3/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var usuario = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("RosaMarco")
                    .ignoresSafeArea()
                
                VStack{
                    Image("LogoMarco")
                        .resizable()
                        .scaledToFit()
                        .frame(height:50)
                    
                    Text("#MuseoParaTodos")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    TextField("Usuario", text: $usuario)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .accentColor(.black)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .accentColor(.black)
                    
                    NavigationLink(
                        destination: MainView(),
                        label: {
                            Text("Iniciar Sesión")
                                .clipShape(Capsule())
                                //.accentColor(.white)
                                .background(Color(.white))
                                .padding()
                                .cornerRadius(10)
                        })
                }
                .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
