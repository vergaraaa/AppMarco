//
//  RVModel.swift
//  AppMarco
//
//  Created by user195902 on 9/5/21.
//

import Foundation

class RVModel:ObservableObject{
    @Published var arrRV = [RecorridoVirtual]()
    
    init(){
        LoadInfo()
    }
    
    func LoadInfo(){
        var rv: RecorridoVirtual
        
        rv = RecorridoVirtual(arrImages: ["1","2","3"],
                              sLink: "https://my.matterport.com/show/?m=eDYbSrs2uRM&sr=-2.84,-1.18&ss=2")
        arrRV.append(rv)
        
        rv = RecorridoVirtual(arrImages: ["2","1","3"],
                              sLink: "https://my.matterport.com/show/?m=eDYbSrs2uRM&sr=-2.84,-1.18&ss=2")
    }
}
