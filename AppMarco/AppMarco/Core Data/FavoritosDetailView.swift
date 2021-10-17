//
//  FavoritosDetailView.swift
//  AppMarco
//
//  Created by Eugenio Peña García on 17/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoritosDetailView: View {
    var expo : ExposFavoritas
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            
            ScrollView{
                VStack{
                    AnimatedImage(url: URL(string: expo.images_wrapped[0]))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .padding()
                    
                    VStack{
                        
                        Text(expo.name_wrapped)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                            
                        Text(expo.author_wrapped)
                            .font(.title3)
                            .padding(.bottom,10)
                        
                        Text(expo.startDate_wrapped + " - " + expo.endDate_wrapped)
                            .font(.callout)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(6)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                            )
                        
                        Text(expo.desc_wrapped)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: WebView(html: expo.virtualTourURL_wrapped),
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

/*struct FavoritosDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosDetailView(expo : ExposFavoritas)
    }
}
*/
