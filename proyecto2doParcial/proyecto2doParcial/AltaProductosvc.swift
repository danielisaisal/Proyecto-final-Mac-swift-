//
//  AltaProductosvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 16/05/23.
//

import Cocoa

class AltaProductosvc: NSViewController {
    
    var modalidad:Bool?
    var productosController = ProductosController.shared
    var id:Int = 0
    var idProductos:Int?
    var idPersona:Int?
    var logincontroller = LoginController.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
        txtIDProducto.isEnabled = false
        if(modalidad == true){
            lblTitulo.stringValue = "Alta"
            btnModificar.isHidden = true
            id = productosController.products.count + productosController.eliminados.count
            txtIDProducto.stringValue = "\(id)"
        }
        else{
            lblTitulo.stringValue = "Modificar"
            AltaProductosvc().title = "Modificar productos"
            btnAlta.isHidden = true
            txtCosto.stringValue = "\(productosController.getIdProducto(id: idProductos!).costo)"
            txtNombre.stringValue = "\(productosController.getIdProducto(id: idProductos!).nombre)"
            txtIDProducto.stringValue = "\(productosController.getIdProducto(id: idProductos!).id)"
            txtDescripcion.stringValue = "\(productosController.getIdProducto(id: idProductos!).descripcion)"
            txtPrecio.stringValue = "\(productosController.getIdProducto(id: idProductos!).precio)"
            cmbUnidad.stringValue = "\(productosController.getIdProducto(id: idProductos!).unidad)"
            txtCategoria.stringValue = "\(productosController.getIdProducto(id: idProductos!).categoria)"
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
        if(txtIDProducto.stringValue == "" || txtNombre.stringValue == "" || cmbUnidad.stringValue == "" || txtCategoria.stringValue == "" || txtDescripcion.stringValue == "" || txtCosto.intValue == 0 || txtPrecio.intValue == 0){
            lblWarning.stringValue = "Faltan campos"
        }
        else{
            productosController.addProduct(product: RegisterProductosModel(id, txtNombre.stringValue, txtDescripcion.stringValue, String(cmbUnidad.stringValue), Double(txtPrecio.doubleValue), Double(txtCosto.doubleValue), txtCategoria.stringValue))
            lblWarning.stringValue = "Producto agregado"
            self.view.window?.windowController?.close()
        }
    }
    @IBAction func btnModificar(_ sender: NSButton) {
        var categoria = txtCategoria.stringValue
        var costo = Double(txtCosto.doubleValue)
        var descripcion = txtDescripcion.stringValue
        var nombre = txtNombre.stringValue
        var precio = Double(txtPrecio.doubleValue)
        var unidad = cmbUnidad.stringValue
        
        if(txtIDProducto.stringValue == "" || txtNombre.stringValue == "" || cmbUnidad.stringValue == "" || txtCategoria.stringValue == "" || txtDescripcion.stringValue == "" || txtCosto.intValue == 0 || txtPrecio.intValue == 0){
            
            lblWarning.stringValue = "Faltan campos"
        }
        else{
            productosController.getIdProducto(id: idProductos!).categoria = categoria
            productosController.getIdProducto(id: idProductos!).costo = costo
            productosController.getIdProducto(id: idProductos!).descripcion = descripcion
            productosController.getIdProducto(id: idProductos!).nombre = nombre
            productosController.getIdProducto(id: idProductos!).precio = precio
            productosController.getIdProducto(id: idProductos!).unidad = unidad
            
            self.view.window?.windowController?.close()
        }
        
    }
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    @IBOutlet weak var color: NSView!
    
}
