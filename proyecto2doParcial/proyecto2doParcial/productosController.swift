//
//  productosController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 17/05/23.
//

import Foundation



class ProductosController{
    @objc dynamic var products = [RegisterProductosModel]()
    var eliminados = [Int]()
    
    static var shared: ProductosController = {
        let instance = ProductosController()
        return instance
    }()
    
    func addProduct(product:RegisterProductosModel) {
        products.append(product)
    }
    
    func getIdProducto (id:Int) -> RegisterProductosModel{
        for product in products {
            if product.id == id{
                return product
            }
        }
        return products[0]
    }
    
    func validacionProducto (id:Int) -> Bool{
        for product in products {
            if product.id == id{
                return true
            }
        }
        return false
    }
    
    func addEliminado() {
        eliminados.append(1)
    }
}

