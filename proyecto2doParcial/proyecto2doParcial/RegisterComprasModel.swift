//
//  RegisterComprasModel.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 10/05/23.
//

import Cocoa

class RegisterComprasModel: NSObject {

    @objc dynamic var idCompra: Int
    @objc dynamic var idProducto: Int
    @objc dynamic var cantidad: Int
    @objc dynamic var idComprador: Int
    @objc dynamic var nombreProducto: String
    
    init(_ idCompra: Int,_ idProducto: Int,_ cantidad: Int,_ idComprador: Int, _ nombreProducto: String) {
        self.idCompra = idCompra
        self.idProducto = idProducto
        self.cantidad = cantidad
        self.idComprador = idComprador
        self.nombreProducto = nombreProducto
    }
}
