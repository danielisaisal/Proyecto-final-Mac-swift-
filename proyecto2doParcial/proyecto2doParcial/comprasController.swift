//
//  comprasController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 20/05/23.
//

import Foundation

class ComprasController{
    @objc dynamic var compras = [RegisterComprasModel]()
    var eliminados = [Int]()
    
    static var shared: ComprasController = {
        let instance = ComprasController()
        return instance
    }()
    
    func addCompra(compra:RegisterComprasModel) {
        compras.append(compra)
    }
    
    func getIdCompra (id:Int) -> RegisterComprasModel{
        for compra in compras {
            if compra.idCompra == id{
                return compra
            }
        }
        return compras[0]
    }
    
    func validacionCompra (id:Int) -> Bool{
        for compra in compras {
            if compra.idCompra == id{
                return true
            }
        }
        return false
    }
    
    func addEliminado() {
        eliminados.append(1)
    }
}
