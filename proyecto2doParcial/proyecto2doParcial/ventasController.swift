//
//  ventasController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 21/05/23.
//

import Foundation

class VentasController{
    @objc dynamic var ventas = [RegisterVentasModel]()
    var eliminados = [Int]()
    var pedidosCliente = [RegisterVentasModel]()
    
    static var shared: VentasController = {
        let instance = VentasController()
        return instance
    }()
    
    func addVenta(venta:RegisterVentasModel) {
        ventas.append(venta)
    }
    
    func getIdVenta (id:Int) -> RegisterVentasModel{
        for venta in ventas {
            if venta.id == id{
                return venta
            }
        }
        return ventas[0]
    }
    
    func validacionVenta (id:Int) -> Bool{
        for venta in ventas {
            if venta.id == id{
                return true
            }
        }
        return false
    }
    
    func addEliminado() {
        eliminados.append(1)
    }
    
    func pedidosUsuario (id:Int){
        for pedido in ventas {
            if pedido.idCliente == id{
                pedidosCliente.append(pedido)
            }
        }
    }
    func borrarArreglo() {
        for pedido in ventas {
            pedidosCliente.removeAll()
        }
    }
}
