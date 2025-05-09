import cosas.*

object camion {
    const cosasCargada = [arena, bumblebee ]

    method cargarCosa(unaCosa) {
      cosasCargada.add(unaCosa)
    }

    method descargarCosa(unaCosa) {
      cosasCargada.remove(unaCosa)
    }

    method pesoTotal() = 1000 + cosasCargada.sum({c=>c.peso()})

    method tieneCosaConPeso(unPeso) = cosasCargada.any({c=>c.peso() == unPeso})

    method cosaMasPesada() = cosasCargada.max({c=>c.peso()})  

    method todoEsPar() = cosasCargada.all({c=>c.peso().even()}) 

    method cosaConPeligrosidad(unNivel) = cosasCargada.find({c=>c.nivelPeligrosidad() == unNivel}) 

    method cosasQueSuperenPeligrosidad(unNivel) = cosasCargada.filter({c=>c.nivelPeligrosidad() > unNivel})

    method cosasMasPeligrosasQue(unaCosa) = self.cosasQueSuperenPeligrosidad(unaCosa.nivelPeligrosidad()) 

    method estaExcedidoDePeso() = self.pesoTotal() > 2500 

    method puedeCircularEnRuta(unNivel) = not self.estaExcedidoDePeso() && self.cosasQueSuperenPeligrosidad(unNivel).isEmpty()
}