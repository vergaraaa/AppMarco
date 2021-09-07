//
//  MarcoView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct MarcoView: View {
    var body: some View {
        ZStack {
            Color("BgVeige")
            
            ScrollView {
                VStack {
                    MapView()
                        .scaledToFit()
                    
                    Group {
                        Text("¡VISÍTANOS!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("RosaMarco"))
                            .padding()
                        
                        Text("Horario de Visitas")
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Text("Martes a Domingo")
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Text("De 10:00 am a 6:00pm")
                            .padding(.bottom, 5)
                        
                        Text("Horarios disponibles: ")
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Text("10:00, 11:30, 13:00, 14:30 y 16:00")
                            .padding(.bottom, 5)
                        
                        Group {
                            Text("Lunes ").bold() + Text("cerrado.")
                        }
                        .padding(.bottom, 5)
                        
                        Group {
                            Text("Tel. ").bold() + Text("(81) 8262 4500")
                        }
                        .padding(.bottom, 5)
                        
                        HStack{
                            NavigationLink(
                                destination: WebView(html: "https://www.facebook.com/museomarcomty/"),
                                label: {
                                    Image("facebook")
                                })
                            
                            NavigationLink(
                                destination: WebView(html: "https://twitter.com/museomarco"),
                                label: {
                                    Image("twitter")
                                })
                            
                            NavigationLink(
                                destination: WebView(html: "https://www.instagram.com/museomarco/"),
                                label: {
                                    Image("instagram")
                                })
                            
                            NavigationLink(
                                destination: WebView(html: "https://www.linkedin.com/company/museomarco/"),
                                label: {
                                    Image("linkedin")
                                })
                        }
                        .padding()
                    } // Group
                    Spacer()
                } // VStack
                .padding(.bottom)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        Image("LogoMarco")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    })
                })
            } // ScrollView
        } // ZStack
    }
}

struct MarcoView_Previews: PreviewProvider {
    static var previews: some View {
        MarcoView()
    }
}
