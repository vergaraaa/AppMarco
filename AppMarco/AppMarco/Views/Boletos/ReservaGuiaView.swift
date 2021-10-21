
import SwiftUI

struct ReservaGuiaView: View {
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    @State var fecha_nueva : Date = Date()
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    @State var cantPer : Int = 1
    @State var hora_elegida: String = "10:00 AM"
    //fecha  dia hora usuario
    var horas_disponibles  = ["10:00 AM", "11:30 AM", "1:00 PM", "2:30 PM", "4:00 PM", "5:30 PM"]
   

    
    var body: some View {
        
        VStack{
            Form {
                DatePicker(
                    selection: $fecha_nueva,
                    displayedComponents: [.date]
                        
                    //reservaVM.$arrReservas
                    //lanzar llamada view model
                    //getReservas()
                )
                .onChange(of: fecha, perform: { value in
                     
                    reservaVM.getReservasDisponibles(date: fecha) { (horarios) in
                            DispatchQueue.main.async {
                            self.horariosDisponibles = horarios
                            }
                    }
                })
                {
                    Text("Fecha")
                }
                
                Picker("Hora", selection: $hora_elegida)
                
                {
                    ForEach(horas_disponibles, id: \.self) {
                        Text($0)
                    }
                }
               
                

                
//
//                Text("Fecha seleccionada \($reservaVM.fecha_nueva, formatter: dateFormatter)")
//
               
                
            }
           
            //for each de los arreglos de reserva
//            Button(action: {
//                reservaVM.addReserva(fecha: fecha_nueva, hora: hora_elegida, cantPer: cantPer, guia:guia)
//
//            }, label: {
//                Text("Aceptar")
//            })
//
        }//.frame()
        .scaledToFit()
        
        VStack{
            
            Text("Lista de Visitas Guiadas")
                .font(.title)
                .fontWeight(.bold)
                
            
            HStack{
                Text("DE esta Hora a Esta Hora ")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("MarcoRosa"))
                
                //Text("Edgar")
            }
            
            
        }
    }
}

struct RevervaGuiaView_Previews: PreviewProvider {
    static var previews: some View {
        ReservaGuiaView()
    }
}
