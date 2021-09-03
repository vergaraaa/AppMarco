//
//  NavAppereanceModifier.swift
//  App05-Entrenimiento
//
//  Created by Elvia Rosas on 02/09/21.
//

import SwiftUI

struct NavApperanceModifier: ViewModifier{
    init(backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor?, hideSeparator: Bool){
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.titleTextAttributes = [.foregroundColor: backgroundColor]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navBarApperance.backgroundColor = backgroundColor
        if hideSeparator{
            navBarApperance.shadowColor = .clear
        }
        UINavigationBar.appearance().standardAppearance = navBarApperance
        UINavigationBar.appearance().compactAppearance = navBarApperance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApperance
        if let tintColor = tintColor{
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View{
    func navigationAppearance(backgroundColor: UIColor, foregroundColor: UIColor, tintColor : UIColor? = nil, hideSeparator: Bool = false) -> some View{
        self.modifier(NavApperanceModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, tintColor: tintColor, hideSeparator: hideSeparator))
    }
}

