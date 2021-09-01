//
//  MarcoView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI

struct MarcoView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Marco")
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
}

struct MarcoView_Previews: PreviewProvider {
    static var previews: some View {
        MarcoView()
    }
}
