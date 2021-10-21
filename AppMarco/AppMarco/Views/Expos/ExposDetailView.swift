//
//  ExposDetailView.swift
//  AppMarco
//
//  Created by user189854 on 9/7/21.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

class AudioManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(audio: String){
        if let url = URL(string: audio) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

struct ExposDetailView: View {
    var expo : Expos
    @State var audio1 = false
    @StateObject private var audioManager = AudioManager()
    var body: some View {
        
        
        ZStack{
            Color("BgVeige")
            
            ScrollView{
                VStack {
                    AnimatedImage(url: URL(string: expo.images[0]))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        
                HStack {
                    Text(expo.name)
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, 5)
                
                    //WebView(html: "http://100.24.228.237:10021/uploads/f5c2794b-d830-4ec5-bc15-b986c3c92412.mp3")
                    
                    Image(systemName: audio1 ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 25))
                        .padding(.trailing)
                        .foregroundColor(Color("RosaMarco"))
                        .onTapGesture {
                            audioManager.playSound(audio: expo.audio)
                            audio1.toggle()
                            
                            if audio1{
                                audioManager.audioPlayer?.play()
                                }
                            else {
                                audioManager.audioPlayer?.pause()
                                }
                            
                        }
                    }
                            
                        Text(expo.author)
                            .font(.title3)
                            .padding(.bottom,10)
                        
                        AddToFavoritosView(filter: expo)
                        
                    VStack {
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
                    
                        Spacer()
                        WebView(html: expo.authorCapsuleURL)
                            .frame(width: 400, height: 250, alignment: .center)
                            .padding(10)
                        
                        Text("GALERIA")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                          
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(1..<expo.images.count, id: \.self) {item in
                                    AnimatedImage(url: URL(string: expo.images[item]))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 400, height: 350, alignment: .center)
                                        .padding()
                                }
                            }
                        }
                  
                    VStack(alignment: .leading) {
                            Text("CURADURIA: " + expo.curatorship)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.gray)
                                
                            
                            Text("MUSEOGRAFIA: " + expo.museography)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.gray)
                                
    
                        Text("SALAS: " + expo.location + "\n")
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal )
                                .foregroundColor(.gray)
                            
                            Text("TECNICA: " + expo.technique)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal )
                                .foregroundColor(.gray)
                            
                            Text("OBRAS: " + expo.totalPieces)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.gray)
                            
                    }.frame(width: 400)
                        
                    
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
