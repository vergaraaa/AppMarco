//
//  FavoritosView.swift
//  AppMarco
//
//  Created by Eugenio Peña García on 17/10/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct FavoritosView: View {
    
    @Environment(\.managedObjectContext) var viewContext
        
    @FetchRequest(
            entity: ExposFavoritas.entity(),
            sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
            var favoritos: FetchedResults<ExposFavoritas>
    
    var body: some View {
        
        ZStack {
            Color(.white)
            
            ScrollView{
                
                Spacer()
                
                
                VStack {
                    Text("EXPOSICIONES FAVORITAS")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(2)
                    
                    
                    VStack{
                        ForEach(favoritos){item in
                            
                            NavigationLink(
                                destination: FavoritosDetailView(expo: item), label: {
                                    VStack{
                                        AnimatedImage(url: URL(string: item.images_wrapped[0]))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 400)
                                            .cornerRadius(10)
                                            .overlay(
                                                ZStack{
                                                    Text(item.startDate_wrapped + " - " + item.endDate_wrapped)
                                                        .font(.callout)
                                                        .fontWeight(.bold)
                                                        .padding(6)
                                                        .foregroundColor(.white)
                                                }.background(Color("RosaMarco"))
                                                .cornerRadius(10.0)
                                                .padding(6), alignment: .bottomLeading
                                            )
                                    }
                                })
                            
                            
                            Text(item.name_wrapped)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom, 5)
                            Text(item.author_wrapped)
                                .font(.title3)
                                .padding(.bottom,5)
                            
                            
                            Spacer()
                            
                        }
                    }
                } // VStack
                /*.navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        Image("LogoMarco")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    })
                })*/
            } // ScrollView
        } // ZStack
    }
}

struct FavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}
