//
//  TablaPedidos.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 16/05/23.
//

import Cocoa

class TablaPedidos: NSViewController {

    @objc dynamic var venta: [RegisterVentasModel]=[]
    @objc dynamic var pedido: [RegisterPedidosModel]=[]
    var logincontroller = LoginController.shared
    var idPersona:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
    }
    
    @IBAction func btnVolver(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
    
}
