import cosas.*
//CAMION
object camion {
    var carga = []
    const pesoPropio = 1000
    const pesoMax = 2500

    method carga() {
      return carga
    }
    method pesoTotal(){
        return pesoPropio + self.pesoCarga()
    }
    method pesoCarga() {
      return carga.sum{c => c.peso()}
    }
    method cargar(cosa) {
      carga.add(cosa)
    }
    method descargar(cosa) {
        if (carga.contains(cosa))
            carga.remove(cosa)
    }
    method pesosCosasSonPares() {
      return carga.all{c => c.peso() % 2 == 0}
    }
    method hayAlgunaCosaQuePese(unNumero) {
      return carga.any{c => c.peso() == unNumero}
    }
    method primeraCargaPeligrosaNivel(unNumero) {
      return carga.find{c => c.nivelPeligro() == unNumero}
    }
    method cosasConUnNivelPeligro_(unNumero) {
      return carga.filter{c => c.nivelPeligro() > unNumero}
    }
    method cosasQueSuperanNivelPeligroDe_(unaCosa) {
      return carga.filter{c => c.nivelPeligro() > unaCosa.nivelPeligro()}
    }
    method estaExcedido() {
      return self.pesoTotal() > pesoMax
    }
    method puedeCircular(nivelPeligrosidad) {
      return !self.estaExcedido() && (self.cosasConUnNivelPeligro_(nivelPeligrosidad)).isEmpty()
    }
} 