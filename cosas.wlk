//COSAS

object knightRider {
    const peso = 500
    const nivelPeligro = 10

    method peso() = peso
    method nivelPeligro() = nivelPeligro 
}

object bumblebee {
    const peso = 800
    var esRobot = true

    method transformarseEnAuto(){esRobot = false}
    method transformarseEnRobot(){esRobot = true}
    method peso() = peso
    method nivelPeligro(){
        if (esRobot)
            return 30
        return 15
    }
}

object paqueteLadrillos {
    var cantLadrillos = 0
    const nivelPeligro = 2

    method cambiarCantLadrillos(nuevaCant) {cantLadrillos = nuevaCant}
    method peso() = cantLadrillos * 2
    method nivelPeligro() = nivelPeligro 
}

object arenaGranel {
    var peso = 20
    const nivelPeligro = 1

    method cambiarPeso(nuevoPeso) {peso = nuevoPeso}
    method peso() = peso
    method nivelPeligro() = nivelPeligro 
}

object bateriaAntiaera {
    var tieneMisiles = true

    method sacarMisiles() {tieneMisiles = false}
    method ponerMisiles() {tieneMisiles = true}
    method peso() {
        if (tieneMisiles)
            return 300
        return 200
    }
    method nivelPeligro() {
        if (tieneMisiles)
            return 100
        return 0
    }
}

object contenedor {
    const contenido = []
    const pesoPropio = 100

    method agregarAlContenedor(unaCosa) {
        contenido.add(unaCosa)
    }
    method sacarDelContenedor(unaCosa) {
        contenido.remove(unaCosa)
    }
    method pesoContenido() {
        return contenido.sum{c => c.peso()}
    }
    method peso() {
        return pesoPropio + self.pesoContenido()
    }
    method nivelPeligro() {
        if (contenido.isEmpty())
            return 0
        return contenido.max{c => c.nivelPeligro()}.nivelPeligro()
    }
}

object residuosRadiactivos {
    var peso = 0
    const nivelPeligro = 200
    method cambiarPeso(nuevoPeso) {peso = nuevoPeso}
    method peso() = peso 
    method nivelPeligro() = nivelPeligro
}

object embalajeSeguridad {
    var objetoDentro = paqueteLadrillos

    method cambiarObjeto(otroObjeto) {
        objetoDentro =  otroObjeto
    }
    method peso() {
        return objetoDentro.peso()
    }
    method nivelPeligro() {
        return objetoDentro.nivelPeligro() / 2
    }
}
