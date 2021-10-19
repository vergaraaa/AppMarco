//
//  EventoDetailView.swift
//  AppMarco
//
//  Created by user189854 on 10/19/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventoDetailView: View {
    
    var evento: Eventos
    
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            
            ScrollView{
                VStack{
                    AnimatedImage(url: URL(string: evento.image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .padding()
                    
                    VStack{
                        
                        Text(evento.name)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                            
                        Text(evento.author)
                            .font(.title3)
                            .padding(.bottom,10)
                        
                        
                        Text(evento.startDate)
                            .font(.callout)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(6)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                            )
                        
                        Text(evento.description)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                    }
                }
            }
        }
        
    }
}

/*struct EventoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventoDetailView(evento: <#T##Eventos#>)
    }
}
*/
