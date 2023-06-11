//
//  AltaProductos.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 18/05/23.
//

import Cocoa

class AltaProductos: NSViewController {

    var modalidad:Bool?
    var productosController = ProductosController.shared
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(modalidad == true){
            lblTitulo.stringValue = "Alta"
            btnModificar.isHidden = true
            
            txtIDProducto.isEnabled = false
            id = productosController.products.count + productosController.eliminados.count
            txtIDProducto.stringValue = "\(id)"
        }
        else{
            lblTitulo.stringValue = "Modificar"
            btnAlta.isHidden = true
        }
    }
   
    
    @IBOutlet weak var txtIDProducto: NSTextField!
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtDescripcion: NSTextField!
    @IBOutlet weak var cmbUnidad: NSComboBoxCell!
    @IBOutlet weak var lblWarning: NSTextField!
    @IBOutlet weak var txtPrecio: NSTextField!
    @IBOutlet weak var txtCosto: NSTextField!
    @IBOutlet weak var txtCategoria: NSTextField!
    @IBOutlet weak var lblTitulo: NSTextField!
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var btnModificar: NSButton!
    @IBAction func btnAlta(_ sender: NSButton) {
        if(txtIDProducto.stringValue == "" || txtCosto.stringValue == "" || txtNombre.stringValue == "" || txtPrecio.stringValue == "" || cmbUnidad.stringValue == "" || txtCategoria.stringValue == "" || txtDescripcion.stringValue == ""){
            lblWarning.stringValue = "Faltan campos"
        }
        else{
            productosController.addProduct(product: RegisterProductosModel(id, txtNombre.stringValue, txtDescripcion.stringValue, String(cmbUnidad.stringValue), Double(txtPrecio.doubleValue), Double(txtCosto.doubleValue), txtCategoria.stringValue))
            lblWarning.stringValue = "Producto agregado"
        }
    }
    @IBAction func btnModificar(_ sender: NSButton) {
    }
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
}
