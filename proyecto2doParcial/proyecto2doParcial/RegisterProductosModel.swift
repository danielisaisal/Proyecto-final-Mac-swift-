//
//  RegisterProductosModel.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 10/05/23.
//

import Cocoa

class RegisterProductosModel: NSObject {

    @objc dynamic var id: Int
    @objc dynamic var nombre: String
    @objc dynamic var descripcion: String
    @objc dynamic var unidad: String
    @objc dynamic var precio: Double
    @objc dynamic var costo: Double
    @objc dynamic var categoria: String
    
    init(_ id: Int,_ nombre: String,_ descipcion: String,_ unidad: String,_ precio: Double,_ costo: Double,_ categoria: String) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descipcion
        self.unidad = unidad
        self.precio = precio
        self.costo = costo
        self.categoria = categoria
    }
    
}
