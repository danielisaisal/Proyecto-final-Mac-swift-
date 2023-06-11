//
//  RegisterUserModel.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 10/05/23.
//

import Cocoa

class RegisterUserModel: NSObject {
    
    @objc dynamic var id: Int
    @objc dynamic var nombre: String
    @objc dynamic var apellidoP: String
    @objc dynamic var apellidoM: String
    @objc dynamic var email: String
    @objc dynamic var password: Int
    @objc dynamic var fechaNacimiento: String
    @objc dynamic var edad: Int
    @objc dynamic var rol: Int
    @objc dynamic var color: NSColor
    @objc dynamic var image: String
    
    init(_ id: Int,_ nombre: String,_ apellidoP: String,_ apellidoM: String,_ email: String,_ password: Int,_ fechaNacimiento: String,_ edad: Int ,_ rol: Int, _ color: NSColor,_ image: String) {
        self.id = id
        self.nombre = nombre
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.email = email
        self.password = password
        self.fechaNacimiento = fechaNacimiento
        self.edad = edad
        self.rol = rol
        self.color = color
        self.image = image
    }
}
