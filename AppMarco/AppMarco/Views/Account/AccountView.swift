//
//  AccountView.swift
//  AppMarco
//
//  Created by user191983 on 9/23/21.
//

import SwiftUI

struct AccountView: View {
//    @Binding var name: String
    @State var offset: CGFloat = 0
    
    @Environment(\.colorScheme) var colorScheme
    @State var currentTab = "Exposiciones Favoritas"
    
    @State var titleOffset: CGFloat = 0
    
    //slider animation
    @Namespace var animation
    @State var tabBarOffset: CGFloat = 0
    
    @EnvironmentObject var loginVM : LoginViewModel
    var body: some View{
    
        ScrollView(.vertical, showsIndicators: false,
            content: {
                //flta line spacing aqui
                VStack{
                    Color("BgVeige")
                
                    //header view
                    GeometryReader{proxy -> AnyView in
                        
                        //sticky header
                        let minY = proxy.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return AnyView(
                        
                            ZStack{
                                
                                //banner
                                Image("marcoBanner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ? 180 + minY:180, alignment: .center)
                                    .cornerRadius(0)
                                
                                BlurView()
                                    .opacity(blurViewOpacity())
                                
                                //title view
//                                VStack(spacing: 4){
//                                    Text("Edgar")
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//
//                                    Text("4 Expos Likeadas")
//                                        .foregroundColor(.white)
//
//                                }
//                                .offset(y: 120)
//                                .offset(y:titleOffset > 60 ? 0 : getTitleTextOffset())
//                                .opacity(titleOffset < 60 ? 1 :0)
                                
                            }
                            //.clipped()
                            //stretch header
                            .frame(height:minY > 0 ? 180 + minY:nil)
                            .offset(y:minY > 0 ? -minY : -minY < 80 ? 0: -minY - 80)
                        )
                    }
                    .frame(height: 180)
                    .zIndex(1)
                    
                    //Profile Image
                    VStack{
                        HStack{
                            Image("2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Rectangle())
                                .padding(8)
                                //.background()
                                .clipShape(Rectangle())
                                .offset(y: offset < 0 ? getOffset() - 20: -20)
                                .scaleEffect(getScale())
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("Edit Profile")
                                    .foregroundColor(Color("RosaMarco"))
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.pink,lineWidth: 1.5))
                            })
                            
                            
                            Button(action: {
                                loginVM.logout()
                                }, label: {
                                Text("Sign Out")
                                    .foregroundColor(Color("RosaMarco"))
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.pink,lineWidth: 1.5))
                            })
                        }
                        .padding(.top,-25)
                        .padding(.bottom, -10)
                        //Profile Data
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Rosa Melano")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("correo.com")
                                .foregroundColor(.gray)
                            Text("Aqui se supone que va un mini texto, bio o what ever se puede quitar si no les gusta SHUTUP AND BENDOVER")
                            
                            HStack(spacing: 5){
                                Text("Expos Likeadas")
                                    .foregroundColor(.gray)
                                Text("4")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                            }
                            .padding(.top, 8)
                        })
                        .overlay(
                            GeometryReader{proxy -> Color in
                                
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async{
                                    self.titleOffset = minY
                                }
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                            ,alignment: .top
                        
                        )
                        
                        //menusito
                        VStack(spacing:0){
                            
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                
                                HStack(spacing:5){
                                    TabButton(title: "Exposiciones Favoritas", currentTab: $currentTab, animation: animation)
//                                    TabButton(title: "Otra cosa", currentTab: $currentTab, animation: animation)
                                }
                                
                            })
                            Divider()
                        }
                        .padding(.top,30)
                        .background(Color("BgVeige"))
                        //editable
                        .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 :0)
                        .overlay (
                            
                            GeometryReader{reader -> Color in
                                    
                                let minY = reader.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.tabBarOffset = minY
                                }
                                
                                
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                            ,alignment: .top
                        
                        )
                        .zIndex(1)
                        
                        VStack(spacing: 18){
                            
                            //expos ejemplo
                            
                            LikeView(note: "Was poppin", expoImg: "2")
                            
                            Divider()
                            
                            ForEach(1...3, id: \.self){_
                                in LikeView(note: sampleText)
                                
                                Divider()
                            }
                            
                        }
                        .padding(.top)
                        .zIndex(0)
                           
                    }
                    .padding(.horizontal)
                    //por si se pasa arriba
                    .zIndex(-offset > 80 ? 0 :1)
                }
            })
            .ignoresSafeArea(.all, edges:.top)
        }
    
    func getTitleTextOffset() -> CGFloat{
        
        let progress = 20 / titleOffset
        
        let offset = 60 * (progress > 0 && progress <= 1 ? progress :1)
        return offset
    }
    
    
    func getOffset()->CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress :20
    }
    
    func getScale() ->CGFloat {
        let progress = -offset / 80
        
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale :1
    }
    
    func blurViewOpacity() -> Double{
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
        
        /*
        
        ZStack{
            Color("BgVeige")
            
            VStack{
                Text("Nombre: ")
//                    TextField("Nombre: ")
                
                Button(action: {
                    loginVM.logout()
                }, label: {
                    Text("Sign out")
                })
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
 
    */
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}

//tab button

struct TabButton: View{
    var title:String
    @Binding var currentTab:String
    var animation:Namespace.ID
    var body: some View{
        Button(action:{
            currentTab = title
        }, label: {
            
            //lazy stack para ver texto completo
            LazyVStack(spacing: 12){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .pink : .gray)
                    .padding(.horizontal)
                if currentTab == title{
                    Capsule()
                        .fill(Color.pink)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else{
                    Capsule()
                        .fill(Color.clear)
                        .frame(height:1.2)
                }
            }
        })
    }
}

    struct LikeView: View {
        var note: String
        var expoImg: String?
        var body: some View {
            
            HStack(alignment: .top, spacing: 10, content: {
                Image("twitter")
                    .resizable()
                    .aspectRatio(contentMode:  .fill)
                    .frame(width:55, height:55)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading, spacing: 10, content: {
                    (
                        Text("La noche bonita")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        
                        Text("@MarcoAntonioSolis")
                            .foregroundColor(.gray)
                    
                    )
                    Text(note)
                        .frame(maxHeight: 100, alignment: .top)
                    
                   
                    if let image = expoImg{
                        GeometryReader{
                            proxy in
                            
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(1)
                        }
                        .frame(height:250 )
                    }
                })
            })
        
        }
    }

var sampleText = "im sample text exdiiiiiiiiiiiii"
