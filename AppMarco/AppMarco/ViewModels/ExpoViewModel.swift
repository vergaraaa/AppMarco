//
//  ExpoModel.swift
//  AppMarco
//
//  Created by user189854 on 9/5/21.
//
import SwiftUI

class ExpoViewModel: ObservableObject{
    @Published var expos = [Expos]()
    
    init(){
        getExpos()
    }
    func getExpos(){
        WebService().getExpos(){ result in
            switch result {
            case .success(let exposResult):
                    print("expos obtenidas")
                self.expos = exposResult
                
            case .failure(let error):
                print(error)
            }
        }
    }
//    func LoadInfo(){
//        var expo : Expos
//
//        expo = Expos(sNombre: "La Poetica del Regreso", sAutor: "Mario Garcia Torres", sFecha: "12 MAR - 21 AGO 2021", sDescripcion: "En esta muestra curada por Taiyana Pimentel, se establece un paralelismo entre las prácticas posconceptuales y de inmersión en la construcción histórica por la que se ha conocido a García Torres, con los inicios de sus estrategias estéticas en las ciudades de Monterrey y México; se analiza a través de obras tempranas, las connotaciones del sentido del espacio y del paisaje nacidos tempranamente en la ciudad que le acogió en su época de formación", urlVisita: "https://www.museomarco.360s.mx/" ,arrImages: ["MarioGarciaTorres"])
//
//        arrExpos.append(expo)
//
//        expo = Expos(sNombre: "Index", sAutor: "MARCO y FF Projects", sFecha: "16 OCT - AGO 2021", sDescripcion: "A raíz de la fuerte crisis económica que enfrentan los museos a nivel internacional, y derivado de la necesidad de buscar nuevos posicionamientos de las producciones artísticas actuales, MARCO pensó en el patio de las esculturas como una posibilidad de generar nexos con la comunidad artística de Monterrey que se ha preocupado por buscar un lugar en el espacio institucional global. Por tal motivo, su directora Taiyana Pimentel en colaboración con los Miembros del Consejo Directivo, pensaron en este proyecto.",urlVisita: "https://www.patiomarco.360s.mx/" ,arrImages: ["index"])
//        arrExpos.append(expo)
//    }
}
