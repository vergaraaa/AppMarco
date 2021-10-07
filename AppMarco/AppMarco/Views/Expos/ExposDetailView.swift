//
//  ExposDetailView.swift
//  AppMarco
//
//  Created by user189854 on 9/7/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExposDetailView: View {
    
    var expo : Expos
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            
            ScrollView{
                VStack{
                    AnimatedImage(url: URL(string: expo.images[0]))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .padding()
                    
                    VStack{
                        
                        Text(expo.name)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                            
                        Text(expo.author)
                            .font(.title3)
                            .padding(.bottom,10)
                        
                        Text(expo.startDate + " - " + expo.endDate)
                            .font(.callout)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(6)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                            )
                        
                        Text(expo.description)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: WebView(html: expo.virtualTourURL),
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
//
//struct ExposDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExposDetailView(expo: Expos(id: "id", name: "nombre", author: "autor", startDate: "fecha", endDate: "fecha", description: "descripcion", virtualTourURL: "url", authorCapsuleURL: "url", images: ["index"]))
//    }
//}
