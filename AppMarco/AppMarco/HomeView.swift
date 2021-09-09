//
//  Home.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct ImageOverlay: View{
    var body: some View{
        ZStack{
            Text("RECORRIDO VIRTUAL")
                .font(.custom("RobotoSlap-Medium", size: 24))
                .padding(10)
                .foregroundColor(.white)
        }.background(Color("RosaMarco"))
        
        .padding(10)
    }
}

struct HomeView: View {
    
    @StateObject var expo = ExpoModel()
    @StateObject var rv = RVModel()
    @State var selected : Int = 0
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    var body: some View {
        
        ZStack{
            Color("BgVeige")
            NavigationLink(
                destination: WebView(html: "https://www.museomarco.360s.mx/"),
                label: {

                ScrollView{
                    VStack {

                        Text("EXPOSICIONES ACTUALES")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                            .padding()
                        
                        TabView(selection:$selected){
                            //Images
                            ForEach(0...2, id: \.self){
                                index in
                                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                                    GeometryReader{reader in
                                        Image("\(String(index))")
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .offset(x:-reader.frame(in:.global).minX)
                                            .frame(width: width, height: height/2)
                                            .cornerRadius(1)
                                            .overlay(ImageOverlay(),alignment: .center)
                                    }
                                    .frame(height: height/2)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(1)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                                    
                                    
                                    //Imagen de Autor de la obra
                                    Image("Marco1")
                                        .resizable()
                                        .aspectRatio(contentMode:  .fill)
                                        .frame(width:55, height: 55)
                                        .clipShape(Circle())
                                        .shadow(color:Color.black.opacity(0.1) , radius: 5, x: 5, y: 5)
                                        .padding(5)
                                        .background((Color("RosaMarco")))
                                        .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
                                        .offset(x:-15, y:25)
                                })
                                .padding(.horizontal,25)
                                
                            }//ForEach EXPO
                        }//TabView
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar(content: {
                            ToolbarItem(placement: .principal, content: {
                                Image("LogoMarco")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                
                            })
                        })
                        .padding(0.1)
                        
                        NavigationLink(
                            destination: WebView(html: "https://www.marco.org.mx/noticias/"),
                            label: {
                                Image("Eventos-1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width, height: height/3)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                                    .cornerRadius(0.1)
                                    

                            })
                        Spacer()
                    }//VSTACK
                } // ScrollView
            }//ZSTACK
        )}//NavLink
    }
    
}

//
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

