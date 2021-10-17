//
//  AddToFavoritosView.swift
//  AppMarco
//
//  Created by Eugenio Peña García on 17/10/21.
//

import SwiftUI

struct AddToFavoritosView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    
    var fetchRequest: FetchRequest<ExposFavoritas>
    var favoritos: FetchedResults<ExposFavoritas> {
          fetchRequest.wrappedValue
    }
    
    var expo : Expos
    
    var body: some View {
        VStack{
            
            if favoritos.count == 0{
                Text("Agregar a Favoritos")
                Button(action: {
                    
                    self.SaveExpoToFav(expo : expo)
                    
                }, label: {
                    Image(systemName : "star")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                })
                
            }
            
            else{
                
                Text("Eliminar de Favoritos")
                Button(action: {
                    
                    self.DeleteExpoFromFav(expo: expo)
                    
                }, label: {
                    Image(systemName : "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24))
                })
                
            }
            
            
            
        }
    }
    
    init(filter: Expos) {

            expo = filter
            fetchRequest = FetchRequest<ExposFavoritas>(entity: ExposFavoritas.entity(), sortDescriptors: [],
                predicate: NSPredicate(format: "id == %@",   filter.id))

        }
    
    func SaveExpoToFav(expo: Expos) {

        let m = ExposFavoritas(context: viewContext)

        m.id = expo.id
        m.name = expo.name
        m.author = expo.author
        m.startDate = expo.startDate
        m.endDate = expo.endDate
        m.desc = expo.description
        m.virtualTourURL = expo.virtualTourURL
        m.authorCapsuleURL = expo.authorCapsuleURL
        m.curatorship = expo.curatorship
        m.museography = expo.museography
        m.location = expo.location
        m.technique = expo.technique
        m.totalPieces = expo.totalPieces
    
        
        var images = [String]()
        for i in expo.images {
            images.append(i)
        }
        m.images = images
        
        try? viewContext.save()

    }
    
    func DeleteExpoFromFav(expo: Expos) {

            if let index = favoritos.firstIndex(where: {$0.id == expo.id}) {
                viewContext.delete(favoritos[index])
                try? viewContext.save()
            }

        }




    
}

struct AddToFavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoritosView(filter : Expos.defaultMedia
        )
    }
}
