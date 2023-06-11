//
//  RegisterPedidosModel.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 10/05/23.
//

import Cocoa

class RegisterPedidosModel: NSObject {

    @objc dynamic var idPedido: Int
    @objc dynamic var idProducto: Int
    @objc dynamic var nombreProducto: String
    @objc dynamic var total: Double
    
    init(idPedido: Int, idProducto: Int, nombreProducto: String, total: Double) {
        self.idPedido = idPedido
        self.idProducto = idProducto
        self.nombreProducto = nombreProducto
        self.total = total
    }
}
