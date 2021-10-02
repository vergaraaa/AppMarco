
//
//  TiendaView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct TiendaView: View {
    var body: some View {
        ZStack {
            Color("BgVeige")
            VStack {
                
                
                
                Image("MarcoTienda")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)

                NavigationLink(
                    destination: WebView(html: "https://storemarco.art/"),
                    label: {
                        Text("COMPRAR EN LÍNEA")
                      
                            .padding(.vertical, 25.0)
                            .padding(.horizontal, 35.0)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                            .background(Color("RosaMarco"))
                            .cornerRadius(25)
                    })
                    .padding(.top, 25)
                
                Group{
                Text("En Tienda Marco estamos comprometidos con la exposición, promoción y desarrollo de los creadores mexicanos.\n\nEn cada compra apoyas a los creadores mexicanos y los programas culturales y educativos del Museo de Arte Contemporáneo de Monterrey")
                }
                //.multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                
                /*Image("Texto")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 20)*/
                
                NavigationLink(
                    destination: WebView(html: "https://my.matterport.com/show/?m=eDYbSrs2uRM&sr=-2.84,-1.18&ss=2"),
                    label: {
                        Text("RECORRIDO VIRTUAL DE LA TIENDA")
                            .underline()
                            .padding(.vertical, 25.0)
                            .padding(.horizontal, 35.0)
                            .foregroundColor(Color("RosaMarco"))
                            

                    })
                    .padding(.top, 15)
                
                
            }

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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

struct TiendaView_Previews: PreviewProvider {
    static var previews: some View {
        TiendaView()
    }
}
