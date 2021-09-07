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
                .foregroundColor(.black)
        }//.background(Color.black)
        
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
            VStack(spacing: 0) {
                HStack {
                    Text("Exposiciones Actuales")
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                        .font(.custom("RobotoSlab-Medium", size:30))
                        .padding()
                        }
                        .offset(y: 3)
                        .frame(minWidth: 0, maxHeight: 7, alignment: .topLeading)
            
            TabView(selection:$selected){
                //Images
                ForEach(1...4, id: \.self){
                    index in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                        GeometryReader{reader in
                            Image("p\(index)")
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
                
         }//VSTACK
            

        }//ZSTACK
    }
          
}

//
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

