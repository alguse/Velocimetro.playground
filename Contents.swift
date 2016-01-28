//: Playground - noun: a place where people can play

import UIKit

enum Velocidades : Int{
    
    case Apagado = 0, VelocidadBaja = 20,VelocidadMedia = 50,VelocidadAlta = 100
    
    init(velocidadInicial velocidad : Int){
        if(velocidad==0){
            self = .Apagado
        }else if (velocidad == 20){
            self = .VelocidadBaja
        }else if (velocidad == 50){
            self = .VelocidadMedia
        }else if (velocidad == 100){
            self = .VelocidadAlta
        }else{
            self = .Apagado
        }
    }
}

class Auto{

    var velocidad = Velocidades(velocidadInicial: 0)
    var actuales = [0, 20, 50, 100]
    var actual : Int = 0
    
    init(velocidadInicial : Velocidades){
        self.velocidad = velocidadInicial
    }
    
    func cambioDeVelocidad( ) -> (actual : Int, velocidadEnCadena: String){
        var mensaje = ""
        
        velocidad = Velocidades(velocidadInicial: actuales[actual])
        
        if velocidad.rawValue == 0 {
            mensaje =  "\(actuales[actual]), Apagado"
        }
        if (velocidad.rawValue > 0) && (velocidad.rawValue <= 20) {
            mensaje = "\(actuales[actual]), Velocidad Baja"
        }
        if (velocidad.rawValue > 20) && (velocidad.rawValue <= 50) {
            mensaje = "\(actuales[actual]), Velocidad Media"
        }
        if (velocidad.rawValue > 50) && (velocidad.rawValue <= 100) {
            mensaje = "\(actuales[actual]), Velocidad Alta"
        }
        
        if actual++ >= 3{
            actual = 1
            actuales = actuales.reverse()
        }

    
        let res = (actual, mensaje)
        return res
    }
}

let auto = Auto(velocidadInicial: Velocidades(velocidadInicial: 0))

for i in 1...20{
    print(auto.cambioDeVelocidad().velocidadEnCadena)
}
