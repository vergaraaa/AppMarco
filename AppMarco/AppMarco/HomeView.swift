//
//  Home.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var rv = RVModel()
    var body: some View {
        ZStack {
            Color("BgVeige")
            VStack(spacing: 10){
                HStack {
                    Text("Exposicones Actuales")
                        .font(.custom("RobotoSlab-Medium", size: 30 ))
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .offset(y: 0)
                .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                VStack{
                    ScrollView(.horizontal, showsIndicators:false){
                        VStack{
                            
                            ForEach(rv.arrRV){ item in
                                    
                                    NavigationLink(
                                        destination: RVView(rv:item),
                                    label: {
                                        
                                        VStack{
                                            Image(item.arrImages[0])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width:300)
                                                .cornerRadius(40)
                                        }
                                    })//NavigationLink
                                }
                            }//VStack
                }

                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        HStack {
                            Image("LogoMarco")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            
                            Spacer()
                            
                            Image(systemName: "person")
                        }
                    })
                })
                }
            }
        }
    
        }
//
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
}
