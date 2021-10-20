
import SwiftUI

struct ReservaGuiaView: View {
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    
    @State var fecha_nueva : Date = Date()
    @State var titulo : String = "Reservacion"
    @State var username : String = "user1"
    @State var cantPer : Int = 1
    @State var hora_elegida: String = "10:00 AM"
    
    var horas_disponibles  = ["10:00 AM", "11:30 AM", "1:00 PM", "2:30 PM", "4:00 PM", "5:30 PM"]
    
    var body: some View {
        VStack{
            Form {
                TextField("titulo", text: $titulo)
                TextField("username", text: $username)
                DatePicker(
                    selection: $fecha_nueva,
                       displayedComponents: [.date]
                ){
                    Text("Fecha")
                }
                
                Picker("Hora", selection: $hora_elegida) {
                    ForEach(horas_disponibles, id: \.self) {
                        Text($0)
                    }
                }
                
                
                //Text("Fecha seleccionada \($reservaVM.fecha_nueva, formatter: dateFormatter)")
                
                
            }
             
//            Button(action: {
//                reservaVM.addReserva(titulo: titulo, username: username, fecha: fecha_nueva, hora: hora_elegida, cantPer: cantPer)
//
//            }, label: {
//                Text("Aceptar")
//            })
            
        }
    }
}

struct RevervaGuiaView_Previews: PreviewProvider {
    static var previews: some View {
        ReservaGuiaView()
    }
}
