//
//  EventosView.swift
//  AppMarco
//
//  Created by user189854 on 10/17/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventosView: View {
    @StateObject var evento = EventosViewModel()
    
    var body: some View {
        ZStack {
            Color("BgVeige")
            VStack {
                ScrollView {
                    
                ForEach(evento.eventos){item in
                    
                    NavigationLink(
                        destination: EventoDetailView(evento: item),
                        label: {
                            VStack{
                                AnimatedImage(url: URL(string: item.image))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400)
                                    .cornerRadius(10)
                                    .overlay(
                                        ZStack{
                                            Text(item.startDate)
                                                .font(.callout)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .padding(6)
                                                .foregroundColor(.white)
                                        }.background(Color("RosaMarco"))
                                        .cornerRadius(10.0)
                                        .padding(6), alignment: .bottomLeading
                                    )
                            }
                            
                        })
                    
                    Text(item.name)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 5)
                    Text(item.author)
                        .font(.title3)
                        .padding(.bottom,5)
                    
                    
                    Spacer()
                    
                    
                }
            }
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

struct EventosView_Previews: PreviewProvider {
    static var previews: some View {
        EventosView()
        
    }
}
