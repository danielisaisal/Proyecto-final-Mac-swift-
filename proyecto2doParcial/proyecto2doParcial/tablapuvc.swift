//
//  tablapuvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 21/05/23.
//

import Cocoa

class tablapuvc: NSViewController {

    var ventasController = VentasController.shared
    @objc dynamic var clientPedidos: [RegisterVentasModel]=[]
    var logincontroller = LoginController.shared
    var idPersona:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
        imgShape.image = NSImage(named: logincontroller.getId(id: idPersona!).image) 
        
    }
    
    @IBAction func btnCerrar(_ sender: NSButton) {
        ventasController.borrarArreglo()
        self.view.window?.windowController?.close()
        
    }
    
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
    
}
