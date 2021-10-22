//
//  RVView.swift
//  AppMarco
//
//  Created by user195902 on 9/5/21.
//

import SwiftUI

struct RVView: View {
    var rv : RecorridoVirtual
    var body: some View {
        
        VStack(alignment: .center){
            NavigationLink(
                destination: WebView(html:rv.sLink),
                label: {
                    Label("Recorrido Virtual", systemImage:"play.rectangle.fill")
                })
            Spacer()
        
        }
    }
           
}

//struct RVView_Previews: PreviewProvider {
//    static var previews: some View {
//        RVView()
//    }
//}
