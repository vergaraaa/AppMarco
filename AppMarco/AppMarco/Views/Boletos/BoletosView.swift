//Boletos view

//
//  BoletosView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct BoletosView: View {
    var body: some View {
        ZStack {
            Color("BgVeige")
            
            VStack {
                
                Group{
                Text("BOLETOS")
                    .font(.title)
                    .bold()
                }
                
                Image(systemName: "ticket.fill")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("RosaMarco"))
                
                Group{
                    Text("Entrada General: ") +
                        Text("$45 pesos").bold()
                }
                .padding()
                
                Group{
                Text("Maestros y estudiantes con credencial, adultos mayores con credencial INAPAM y niños de 5 a 15 años: ") + Text("$30 pesos").bold()
                }
                .multilineTextAlignment(.center)
                
                
                Text("MIÉRCOLES ENTRADA LIBRE")
                    .bold()
                    .padding()
                
                NavigationLink(
                    destination: WebView(html: "http://factura.marco.org.mx/tickets_marco/validar_usuario.aspx"),
                    label: {
                        Text("COMPRAR BOLETOS")
                            .bold()
                            .padding()
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                            .background(Color("RosaMarco"))
                            .cornerRadius(25)

                    })
                    .padding()
                
                NavigationLink(
                    destination: ReservaRestauranteView(),
                    label: {
                        Text("RESTAURANTE")
                            .bold()
                            .font(.title2)
                            .padding()
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("RosaMarco"), lineWidth: 3)
                                )
                    })
                
                NavigationLink(
                    destination: ReservaGuiaView(),
                    label: {
                        Text("AGENDAR TU VISITA")
                            .bold()
                            .font(.title2)
                            .padding()
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("RosaMarco"), lineWidth: 3)
                                )
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

struct BoletosView_Previews: PreviewProvider {
    static var previews: some View {
        BoletosView()
    }
}

