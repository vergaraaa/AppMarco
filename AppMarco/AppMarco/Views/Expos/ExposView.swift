//
//  ExposView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExposView: View {
    
    @StateObject var expo = ExpoViewModel()
    
    var body: some View {
        ZStack {
            Color("BgVeige")
            
            ScrollView{
                
                VStack {
                    Text("EXPOSICIONES")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                                        
                    VStack{
                        ForEach(expo.expos){item in
                            
                            NavigationLink(
                                destination: ExposDetailView(expo: item), label: {
                                    VStack{
                                        AnimatedImage(url: URL(string: item.images[0]))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 400)
                                            .cornerRadius(10)
                                            .overlay(
                                                ZStack{
                                                    Text(item.startDate + " - " + item.endDate)
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
         
                            
                        }
                    }
                } // VStack
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

struct ExposView_Previews: PreviewProvider {
    static var previews: some View {
        ExposView()
    }
}
