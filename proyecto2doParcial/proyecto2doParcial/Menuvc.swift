//
//  Menuvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 15/05/23.
//

import Cocoa

class Menuvc: NSViewController {

    var flag:Bool?
    var mensaje:String?
    var loginController = LoginController.shared
    var productosController = ProductosController.shared
    var comprasController = ComprasController.shared
    var ventasController = VentasController.shared
    var pedidosController = PedidosController.shared
    var cambioModuloUser:Bool?
    var idUser:Int?
    var idVenta:Int?
    var id = 0
    var idProduct:Int?
    var idPersona:Int?
    var rol: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        lblMensaje.stringValue = mensaje!
        color.wantsLayer = true
        color.layer?.backgroundColor = loginController.getId(id: idPersona!).color.cgColor
        imgShape.image = NSImage(named: loginController.getId(id: idPersona!).image)
        
        if(rol == 4){
            cajaAdministrador.isHidden = false
            cajaVendedores.isHidden = false
            cajaCompradores.isHidden = false
        }
        if(rol == 2){
            cajaVendedores.isHidden = true
            cajaAdministrador.isHidden = true
            cajaCompradores.isHidden = false
        }
        if(rol == 3){
            cajaCompradores.isHidden = true
            cajaAdministrador.isHidden = true
            cajaVendedores.isHidden = false
        }
        //cajaCompradores.isHidden = true
        
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "altaUsuarios"){
            let destinationVC = segue.destinationController as! registroConRol
            destinationVC.cambioModuloUser = cambioModuloUser
            destinationVC.posicion = idUser
            destinationVC.idPersona = idPersona
        }
        if(segue.identifier == "tablaUsuarios"){
            (segue.destinationController as! tablaUsuariosvc).clientLog = loginController.users
            (segue.destinationController as! tablaUsuariosvc).idPersona = idPersona
        }
        if(segue.identifier == "altaVendedores"){
            let destinationVC = segue.destinationController as! vendedorvc
            destinationVC.modalidad = flag
            destinationVC.idVenta = idVenta
            destinationVC.idPersona = idPersona
        }
        if(segue.identifier == "tablaPedidos"){
            let destinationVC = segue.destinationController as! TablaPedidos
            destinationVC.venta = ventasController.ventas
            destinationVC.pedido = pedidosController.pedidos
            destinationVC.idPersona = idPersona
        }
        if(segue.identifier == "altaProductos"){
            let destinationVC = segue.destinationController as! AltaProductosvc
            destinationVC.modalidad = flag
            destinationVC.idProductos = idProduct
            destinationVC.idPersona = idPersona
        }
        if(segue.identifier == "tablaProductos"){
            (segue.destinationController as! Tablapvc).product = productosController.products
            (segue.destinationController as! Tablapvc).idPersona = idPersona
            
        }
        if(segue.identifier == "altaCompras"){
            let destinationVC = segue.destinationController as! AltaComprasvc
            destinationVC.modulo = flag
            destinationVC.idComprador = idPersona
            destinationVC.idCompra = idProduct
            destinationVC.idPersona = idPersona
        }
        if(segue.identifier == "tablaCompras"){
            let destinationVC = segue.destinationController as! Tablacvc
            destinationVC.compra = comprasController.compras
            destinationVC.idPersona = idPersona
        }
    }
    
    //Outlets Menu
    @IBOutlet weak var lblMensaje: NSTextField!
    
    @IBOutlet weak var lblWarning: NSTextFieldCell!
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    //Actions y outlets Administrador
    @IBAction func btnAltaUsuarios(_ sender: NSButton) {
        cambioModuloUser = true
        performSegue(withIdentifier: "altaUsuarios", sender: self)
    }
    @IBAction func btnModificarUsuarios(_ sender: NSButton) {
        cambioModuloUser = false
        idUser = Int(txtIdUsuarios.intValue)
        if(txtIdUsuarios.stringValue == ""){
            lblWarning.stringValue = "No hay un id"
        }
        else{
            if(loginController.validacionAdmin(id: idUser!)){
                performSegue(withIdentifier: "altaUsuarios", sender: self)
            }
            else{
                lblWarning.stringValue = "No existe"
            }
        }
        
    }
    @IBAction func btnBajaUsuarios(_ sender: NSButton) {
        if(txtIdUsuarios.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            id = Int(txtIdUsuarios.intValue)
            if(loginController.validacionAdmin(id: id)){
                loginController.addEliminado()
                loginController.users.remove(at: id)
                lblWarning.stringValue = "Usuario eliminado"
            }
            else{
                lblWarning.stringValue = "No hay usuario"
            }
        }
    }
    @IBAction func btnConsultarUsuarios(_ sender: NSButton) {
        performSegue(withIdentifier: "tablaUsuarios", sender: self)
    }
    
    @IBOutlet weak var txtIdUsuarios: NSTextField!
    
    //Actions y outlets Vendedores
    @IBAction func btnPedido(_ sender: NSButton) {
        if(comprasController.compras.isEmpty){
            lblWarning.stringValue = "No hay compras"
        }
        else{
            flag = true
            performSegue(withIdentifier: "altaVendedores", sender: self)
        }
    }
    @IBAction func btnConsultarPedidos(_ sender: NSButton) {
            flag = true
            performSegue(withIdentifier: "tablaPedidos", sender: self)
    }
    @IBAction func btnModificarPedido(_ sender: NSButton) {
        if(txtIDPedido.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            idVenta = Int(txtIDPedido.intValue)
            if(ventasController.validacionVenta(id: idVenta!)){
                if(comprasController.getIdCompra(id: idVenta!).cantidad == 0){
                    lblWarning.stringValue = "No hay productos en inventario"
                }
                else{
                    flag = false
                    performSegue(withIdentifier: "altaVendedores", sender: self)
                }
                
            }
            else{
                lblWarning.stringValue = "No existe"
            }
            
        }
    }
    
    @IBAction func btnCancelarPedido(_ sender: NSButton) {
        idVenta = Int(txtIDPedido.intValue)
        if(txtIDPedido.stringValue == ""){
            lblWarning.stringValue = "No hay id"
        }
        else{
            if(ventasController.validacionVenta(id: idVenta!)){
                ventasController.addEliminado()
                ventasController.ventas.remove(at: idVenta!)
                pedidosController.addEliminado()
                pedidosController.pedidos.remove(at: idVenta!)
                lblWarning.stringValue = "Venta cancelada"
            }
            else{
                lblWarning.stringValue = "No existe"
            }
        }
    }
    
    @IBOutlet weak var btnCancelarPedido: NSButton!
    @IBOutlet weak var txtIDPedido: NSTextField!
    
    //Actions y outlets Productos
    
    @IBAction func btnAgregarProducto(_ sender: NSButtonCell) {
        flag = true
        performSegue(withIdentifier: "altaProductos", sender: self)
    }
    @IBAction func btnEliminarProducto(_ sender: NSButton) {
        idProduct = Int(txtIdProducto.intValue)
        if(txtIdProducto.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            if(productosController.validacionProducto(id: idProduct!)){
                productosController.addEliminado()
                productosController.products.remove(at: id)
                lblWarning.stringValue = "Producto eliminado"
            }
            else{
                lblWarning.stringValue = "No hay producto"
            }
            lblWarning.stringValue = "Producto eliminado"
        }
    }
    @IBAction func btnConsultarProductos(_ sender: NSButton) {
        performSegue(withIdentifier: "tablaProductos",  sender: self)
    }
    @IBAction func btnModificarProductos(_ sender: NSButton) {
        flag = false
        idProduct = Int(txtIdProducto.intValue)
        if(txtIdProducto.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            if(productosController.validacionProducto(id: idProduct!)){
                performSegue(withIdentifier: "altaProductos", sender: self)
            }
            else{
                lblWarning.stringValue = "No existe"
            }
        }
    }
    @IBOutlet weak var txtIdProducto: NSTextField!
    
    
    //Actions y outlets Compras
    
    @IBOutlet weak var btnAgregarCompra: NSButton!
    @IBAction func btnAgregarCompra(_ sender: NSButton) {
        if(productosController.products.isEmpty){
            lblWarning.stringValue = "No hay productos"
        }
        else{
            flag = true
            performSegue(withIdentifier: "altaCompras", sender: self)
        }
        
    }
    @IBAction func btnEliminarCompra(_ sender: NSButton) {
        idProduct = Int(txtIdProducto.intValue)
        if(txtIdProducto.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            if(productosController.validacionProducto(id: idProduct!)){
                productosController.addEliminado()
                loginController.users.remove(at: id)
                lblWarning.stringValue = "Producto eliminado"
            }
            else{
                lblWarning.stringValue = "No hay usuario"
            }
        }
        
    }
    @IBAction func btnConsultarCompras(_ sender: NSButton) {
        performSegue(withIdentifier: "tablaCompras", sender: self)
    }
    @IBAction func btnModificarCompras(_ sender: NSButton) {
        flag = false
        idProduct = Int(txtIdProducto.intValue)
        if(txtIdProducto.stringValue == ""){
            lblWarning.stringValue = "Falta id"
        }
        else{
            if(comprasController.validacionCompra(id: idProduct!)){
                performSegue(withIdentifier: "altaCompras", sender: self)
            }
            else{
                lblWarning.stringValue = "No existe"
            }
        }
        
    }
    
    //Outlets contenedores
    @IBOutlet weak var cajaCompradores: NSBox!
    @IBOutlet weak var cajaAdministrador: NSBox!
    @IBOutlet weak var cajaVendedores: NSBox!
    
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
    
}
