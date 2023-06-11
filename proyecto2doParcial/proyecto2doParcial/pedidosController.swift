//
//  pedidosController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 21/05/23.
//

import Foundation

class PedidosController{
    @objc dynamic var pedidos = [RegisterPedidosModel]()
    var eliminados = [Int]()
    var PedidosCliente = [RegisterPedidosModel]()
    
    static var shared: PedidosController = {
        let instance = PedidosController()
        return instance
    }()
    
    func addPedido(pedido:RegisterPedidosModel) {
        pedidos.append(pedido)
    }
    
    func getIdPedido (id:Int) -> RegisterPedidosModel{
        for pedido in pedidos {
            if pedido.idPedido == id{
                return pedido
            }
        }
        return pedidos[0]
    }
    
    func getIdPedidoUsuario (id:Int) -> RegisterPedidosModel{
        for pedido in pedidos {
            if pedido.idPedido == id{
                return pedidos[id]
            }
        }
        return pedidos[0]
    }
    
    func validacionPedido (id:Int) -> Bool{
        for pedido in pedidos {
            if pedido.idPedido == id{
                return true
            }
        }
        return false
    }
    
    func pedidosUsuario (id:Int){
        for pedido in pedidos {
            if pedido.idPedido == id{
                pedidos.append(pedido)
            }
        }
    }
    
    func addEliminado() {
        eliminados.append(1)
    }
}
