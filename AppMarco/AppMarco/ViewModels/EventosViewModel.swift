//
//  EventosViewModel.swift
//  AppMarco
//
//  Created by user189854 on 10/18/21.
//
import SwiftUI

class EventosViewModel: ObservableObject{
    @Published var eventos = [Eventos]()
    
    init(){
        getActivity()
    }
    func getActivity(){
        WebService().getEventos(){ result in
            switch result {
            case .success(let exposResult):
                    print("eventos obtenidas")
                self.eventos = exposResult
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

