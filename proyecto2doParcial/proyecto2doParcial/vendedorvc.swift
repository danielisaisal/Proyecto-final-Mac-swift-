//
//  vendedorvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 16/05/23.
//

import Cocoa

class vendedorvc: NSViewController {

    var ventasController = VentasController.shared
    var comprasController = ComprasController.shared
    var productosController = ProductosController.shared
    var pedidosController = PedidosController.shared
    var loginController = LoginController.shared
    var modalidad: Bool?
    var idVenta:Int?
    var idPersona:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = loginController.getId(id: idPersona!).color.cgColor
        if(modalidad ==  true){
            btnModificar.isHidden = true
            lblTitulo.stringValue = "Alta"
            txtID.isEnabled = false
            txtID.stringValue = "\(ventasController.ventas.count + ventasController.eliminados.count)"
            txtSubTotal.isEnabled = false
            txtIVA.isEnabled = false
            txtTotal.isEnabled = false
        }
        else{
            txtID.isEnabled = false
            btnAlta.isHidden = true
            lblTitulo.stringValue = "Modificar"
            txtSubTotal.isEnabled = false
            txtIVA.isEnabled = false
            txtTotal.isEnabled = false
            txtID.stringValue = "\(ventasController.getIdVenta(id: idVenta!).id)"
            txtIVA.stringValue = "\(ventasController.getIdVenta(id: idVenta!).IVA)"
            txtTotal.stringValue = "\(ventasController.getIdVenta(id: idVenta!).total)"
            txtCantidad.stringValue = "\(ventasController.getIdVenta(id: idVenta!).cantidad)"
            txtSubTotal.stringValue = "\(ventasController.getIdVenta(id: idVenta!).subtotal)"
            txtIDCliente.stringValue = "\(ventasController.getIdVenta(id: idVenta!).idCliente)"
            txtIDProducto.stringValue = "\(ventasController.getIdVenta(id: idVenta!).idProducto)"
        }
    }
    
    //IBOutles y actions
    
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var txtIDCliente: NSTextField!
    @IBOutlet weak var txtIDProducto: NSTextField!
    @IBOutlet weak var txtCantidad: NSTextField!
    @IBOutlet weak var txtSubTotal: NSTextField!
    @IBOutlet weak var txtIVA: NSTextField!
    @IBOutlet weak var txtTotal: NSTextField!
    @IBOutlet weak var lblWarning: NSTextField!
    @IBOutlet weak var lblTitulo: NSTextField!
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var color: NSView!
    @IBAction func btnModificar(_ sender: NSButton) {
        
        if(txtID.stringValue == "" || txtIVA.stringValue == "" || txtTotal.stringValue == "" || txtCantidad.stringValue == "" || txtSubTotal.stringValue == "" || txtIDCliente.stringValue == "" || txtIDProducto.stringValue == ""){
            lblWarning.stringValue = "Faltan datos"
        }
        else{
            if(loginController.validacionAdmin(id: Int(txtIDCliente.intValue))){
                if(loginController.getRol(id: Int(txtIDCliente.intValue)).rol == 1){
                    if(productosController.validacionProducto(id: Int(txtIDProducto.intValue))){
                        if(txtCantidad.intValue > comprasController.getIdCompra(id: Int(txtIDProducto.intValue)).cantidad){
                            lblWarning.stringValue = "Cantidad sobrepasada"
                        }
                        else{
                            ventasController.getIdVenta(id: idVenta!).IVA = Double(txtIVA.doubleValue)
                            ventasController.getIdVenta(id: idVenta!).subtotal = Double(txtSubTotal.doubleValue)
                            ventasController.getIdVenta(id: idVenta!).total = Double(txtTotal.doubleValue)
                            ventasController.getIdVenta(id: idVenta!).cantidad = Int(txtCantidad.intValue)
                            ventasController.getIdVenta(id: idVenta!).id = Int(txtID.intValue)
                            ventasController.getIdVenta(id: idVenta!).idCliente = Int(txtIDCliente.intValue)
                            ventasController.getIdVenta(id: idVenta!).idProducto = Int(txtIDProducto.intValue)
                            ventasController.getIdVenta(id: idVenta!).nombreProducto = ventasController.getIdVenta(id: Int(txtIDProducto.intValue)).nombreProducto
                            
                            pedidosController.getIdPedido(id: Int(idVenta!)).idPedido = Int(txtID.intValue)
                            pedidosController.getIdPedido(id: idVenta!).idProducto = Int(txtIDProducto.intValue)
                            pedidosController.getIdPedido(id: idVenta!).nombreProducto = pedidosController.getIdPedido(id: Int(txtIDProducto.intValue)).nombreProducto
                            pedidosController.getIdPedido(id: idVenta!).total = pedidosController.getIdPedido(id: Int(txtIDProducto.intValue)).total
                            
                            comprasController.getIdCompra(id: Int(txtIDProducto.intValue)).cantidad -= Int(txtCantidad.intValue)
                            
                            
                                
                            lblWarning.stringValue = "modificado"
                                
                                self.view.window?.windowController?.close()
                        }
                    }
                    else{
                        lblWarning.stringValue = "No existe"
                    }
                }
                else{
                    lblWarning.stringValue = "No es cliente"
                }
            }
            else{
                lblWarning.stringValue = "No existe"
            }
        }
    }
    
    @IBAction func btnAlta(_ sender: NSButton) {
        if(txtID.stringValue == "" || txtIVA.stringValue == "" || txtTotal.stringValue == "" || txtCantidad.stringValue == "" || txtSubTotal.stringValue == "" || txtIDCliente.stringValue == "" || txtIDProducto.stringValue == ""){
            lblWarning.stringValue = "Faltan datos"
        }
        else{
            if(comprasController.validacionCompra(id: Int(txtIDProducto.intValue))){
                if(loginController.validacionAdmin(id: Int(txtIDCliente.intValue))){
                    if(loginController.validacionAdmin(id: Int(txtIDCliente.intValue))){
                        if(loginController.getRol(id: Int(txtIDCliente.intValue)).rol == 1){
                            if(txtCantidad.intValue > comprasController.getIdCompra(id: Int(txtIDProducto.intValue)).cantidad){
                                lblWarning.stringValue = "No hay tantos productos"
                            }
                            else{
                                ventasController.addVenta(venta: RegisterVentasModel(Int(txtID.intValue), Int(txtIDCliente.intValue), Int(txtIDProducto.intValue), Int(txtCantidad.intValue), Double(txtSubTotal.doubleValue), Double(txtIVA.doubleValue), Double(txtTotal.doubleValue), productosController.getIdProducto(id: Int(txtIDProducto.intValue)).nombre))
                                pedidosController.addPedido(pedido: RegisterPedidosModel(idPedido: Int(txtID.intValue), idProducto: Int(txtIDProducto.intValue), nombreProducto: comprasController.getIdCompra(id: Int(txtIDProducto.intValue)).nombreProducto, total: ventasController.getIdVenta(id: Int(txtID.intValue)).total))
                                comprasController.getIdCompra(id: Int(txtIDProducto.intValue)).cantidad -= Int(txtCantidad.intValue)
                                lblWarning.stringValue = "Venta realizada"
                                
                                self.view.window?.windowController?.close()
                            }
                        }
                        else{
                            lblWarning.stringValue = "No es cliente"
                        }
                    }
                    else{
                        lblWarning.stringValue = "No existre ese cliente"
                    }
                }
            }
        }
    }
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    
    @IBAction func txtCantidad(_ sender: NSTextField) {
        let mensaje = sender.intValue
        var subtotal:Double = Double(mensaje) * productosController.getIdProducto(id: Int(txtIDProducto.intValue)).precio
        var IVA:Double = subtotal * 0.16
        var total:Double = subtotal + IVA
        
        txtSubTotal.stringValue = "\(subtotal)"
        txtIVA.stringValue = "\(IVA)"
        txtTotal.stringValue = "\(total)"
    }
    
}
