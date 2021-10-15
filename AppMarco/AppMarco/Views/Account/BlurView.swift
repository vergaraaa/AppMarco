//
//  BlurView.swift
//  AppMarco
//
//  Created by user195902 on 10/15/21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        
        return view
        
    }
    
   
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
