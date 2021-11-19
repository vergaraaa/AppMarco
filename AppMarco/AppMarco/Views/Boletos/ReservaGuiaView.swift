
import SwiftUI

struct ReservaGuiaView: View {
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    @State var fecha_nueva : Date = Date()
    var email : String = UserDefaults.standard.string(forKey: "email") ?? ""
    var password : String = UserDefaults.standard.string(forKey: "password") ?? ""
    var id : String = UserDefaults.standard.string(forKey: "id") ?? ""
    var name : String = UserDefaults.standard.string(forKey: "name") ?? ""
    var lastname : String = UserDefaults.standard.string(forKey: "lastname") ?? ""

    @State var ReservacionesDisponibles = [ReservasModel]()
    
    
    var body: some View {

        VStack{
            //posible logo
            Text("Agenda tu Visita a #MuseoDeTodos")
                .font(.title)
                .bold()
                .padding()
                .border(Color("RosaMarco"), width: 7)
            
            DatePicker(
                "",
                selection: $fecha_nueva,
                displayedComponents: [.date]
                   
                //reservaVM.$arrReservas
                //lanzar llamada view model
                //getReservas()
            )
           
            .onChange(of: fecha_nueva, perform: { value in
                reservaVM.getReservasFechas(fecha: fecha_nueva) { (result) in
                    DispatchQueue.main.async {
                        self.ReservacionesDisponibles = result
                        print(self.ReservacionesDisponibles)
                        print(self.email)
                        print(self.password)
                        print(self.id)
                        print(self.name)
                        print(self.lastname)
                    }
                }
            })
            .datePickerStyle(WheelDatePickerStyle())
            .padding()
            ForEach(ReservacionesDisponibles){ item in
                NavigationLink(destination: ReservaGuiaDetailView(reservation: item), label: {
                    HStack{
                        Text("Hora de Recorrido: " + item.hour)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding()
                           // .scaledToFit()
                        Text("Nombre de Guia: " + item.guide.name)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding()
                          //  .scaledToFit()
                    }
                    
                })
            }
                
                   
                
        }
        .navigationTitle("Agenda una Visita")
        .frame(width: 400, height: 400, alignment: .top)
        .padding()
        .scaledToFit()
        .foregroundColor(.black)
        //.background(Color("RosaMarco"))
        
        
        
        
    }
}

struct RevervaGuiaView_Previews: PreviewProvider {
    static var previews: some View {
        ReservaGuiaView()
    }
}
