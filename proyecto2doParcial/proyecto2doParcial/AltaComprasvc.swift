//
//  AltaComprasvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 16/05/23.
//

import Cocoa

class AltaComprasvc: NSViewController, NSTextFieldDelegate {

    var modulo:Bool?
    var idComprador:Int?
    var comprasController = ComprasController.shared
    var idCompra:Int?
    var idPersona:Int?
    var productosController = ProductosController.shared
    var logincontroller = LoginController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
        
        if(modulo == true){
            lblTitulo.stringValue = "Alta"
            btnModificar.isHidden = true
            txtIdComprador.isEnabled = false
            txtIdComprador.stringValue = "\(idComprador!)"
            txtIdCompra.isEnabled = false
            txtIdCompra.stringValue = String(comprasController.compras.count + comprasController.eliminados.count)
        }
        else{
            lblTitulo.stringValue = "Modificar"
            btnAlta.isHidden = true
            txtIdCompra.isEnabled = false
            txtIdComprador.isEnabled = false
            txtIdProducto.isEnabled = false
            txtCantidad.stringValue = "\(comprasController.getIdCompra(id: idCompra!).cantidad)"
            txtIdCompra.stringValue = "\(comprasController.getIdCompra(id: idCompra!).idCompra)"
            txtIdProducto.stringValue = "\(comprasController.getIdCompra(id: idCompra!).idComprador)"
            txtIdComprador.stringValue = "\(comprasController.getIdCompra(id: idCompra!).idProducto)"
            
        }
    }
    
    @IBOutlet weak var txtIdCompra: NSTextField!
    @IBOutlet weak var txtIdProducto: NSTextField!
    @IBOutlet weak var txtCantidad: NSTextField!
    @IBOutlet weak var txtIdComprador: NSTextField!
    @IBOutlet weak var lblTitulo: NSTextField!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var lblWarning: NSTextField!
    
    @IBAction func btnModificar(_ sender: NSButton) {
        if(txtCantidad.stringValue == "" || txtIdCompra.stringValue == "" || txtIdProducto.stringValue == "" || txtIdComprador.stringValue == ""){
        }
        else{
            if(txtCantidad.intValue == 0){
                lblWarning.stringValue = "no puedes comprar 0"
            }
            else{
                if(productosController.validacionProducto(id: Int(exactly: txtIdProducto.intValue)!)){
                    comprasController.getIdCompra(id: idCompra!).cantidad = Int(txtCantidad.intValue)
                    comprasController.getIdCompra(id: idCompra!).idCompra = Int(txtIdCompra.intValue)
                    comprasController.getIdCompra(id: idCompra!).idComprador = Int(txtIdComprador.intValue)
                    comprasController.getIdCompra(id: idCompra!).idProducto = Int(txtIdProducto.intValue)
                    comprasController.getIdCompra(id: idCompra!).nombreProducto = comprasController.getIdCompra(id: Int(txtIdProducto.intValue)).nombreProducto
                    lblWarning.stringValue = "Compra modificada"
                    self.view.window?.windowController?.close()
                }
                else{
                    lblWarning.stringValue = "No existe el producto"
                }
            }
            
            
        }
        
    }
    
    @IBOutlet weak var btnAlta: NSButton!
    @IBAction func btnAlta(_ sender: NSButton) {
        if(txtIdCompra.stringValue == "" || txtIdProducto.stringValue == "" || txtCantidad.stringValue == "" || txtIdComprador.stringValue == ""){
            lblWarning.stringValue = "Falta un campo"
        }
        else{
            if(txtCantidad.intValue == 0){
                lblWarning.stringValue = "no puedes comprar 0"
            }
            else{
                if(productosController.validacionProducto(id: Int(exactly: txtIdProducto.intValue)!)){
                    comprasController.addCompra(compra: RegisterComprasModel(Int(txtIdCompra.intValue), Int(txtIdProducto.intValue), Int(txtCantidad.intValue), Int(txtIdComprador.intValue), productosController.getIdProducto(id: Int(txtIdProducto.intValue)).nombre))
                    
                    lblWarning.stringValue = "Compra registrada"
                    self.view.window?.windowController?.close()
                }
                else{
                    lblWarning.stringValue = "No existe el producto"
                }
            }
        }
        
    }
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    @IBOutlet weak var color: NSView!
    
}

//funciones

