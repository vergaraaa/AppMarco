//
//  ComprarBoletosView.swift
//  AppMarco
//
//  Created by user188940 on 9/6/21.
//

import SwiftUI

struct ComprarBoletosView: View {
    var body: some View {
        NavigationLink(
            destination: WebView(html: "http://factura.marco.org.mx/tickets_marco/validar_usuario.aspx"),
            label: {
                Text("Comprar Boleto")
              
                    .padding(.vertical, 25.0)
                    .padding(.horizontal, 35.0)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .background(Color("RosaMarco"))	
                    .cornerRadius(25)
            })
            .padding(.top, 25)
    }
}

struct ComprarBoletosView_Previews: PreviewProvider {
    static var previews: some View {
        ComprarBoletosView()
    }
}
