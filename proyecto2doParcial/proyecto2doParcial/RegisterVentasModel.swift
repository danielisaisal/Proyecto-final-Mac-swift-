//
//  RegisterVentasModel.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 10/05/23.
//

import Cocoa

class RegisterVentasModel: NSObject {

    @objc dynamic var id: Int
    @objc dynamic var idCliente: Int
    @objc dynamic var idProducto: Int
    @objc dynamic var cantidad: Int
    @objc dynamic var subtotal: Double
    @objc dynamic var IVA: Double
    @objc dynamic var total: Double
    @objc dynamic var nombreProducto: String
    
    init(_ id: Int,_ idCliente: Int,_ idProducto: Int,_ cantidad: Int,_ subtotal: Double,_ IVA: Double,_ total: Double,_ nombreProducto: String) {
        self.id = id
        self.idCliente = idCliente
        self.idProducto = idProducto
        self.cantidad = cantidad
        self.subtotal = subtotal
        self.IVA = IVA
        self.total = total
        self.nombreProducto = nombreProducto
    }
}
