//
//  ExposDetailView.swift
//  AppMarco
//
//  Created by user189854 on 9/7/21.
//

import SwiftUI

struct ExposDetailView: View {
    
    var expo : Expos
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            
            ScrollView{
                VStack{
                    Image(expo.arrImages[0])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .padding()
                    
                    VStack{
                        
                        Text(expo.sNombre)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                            
                        Text(expo.sAutor)
                            .font(.title3)
                            .padding(.bottom,10)
                        
                        Text(expo.sFecha)
                            .font(.callout)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(6)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                            )
                        
                        Text(expo.sDescripcion)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: WebView(html: expo.urlVisita),
                            label: {	
                                Text("RECORRIDO VIRTUAL")
                                    .font(.callout)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(10)
                                    .foregroundColor(.white)                                    .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                                )
                                
                            })
                    }
                }
            }
        }
    }
}

struct ExposDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExposDetailView(expo: Expos(sNombre: "nombre", sAutor: "autor", sFecha: "fecha", sDescripcion: "descripcion", urlVisita: "url", arrImages: ["index"]))
    }
}
