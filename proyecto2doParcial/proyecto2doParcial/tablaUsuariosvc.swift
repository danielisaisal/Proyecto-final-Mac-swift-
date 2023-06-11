//
//  tablaUsuariosvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 15/05/23.
//

import Cocoa

class tablaUsuariosvc: NSViewController {

    @objc dynamic var clientLog: [RegisterUserModel]=[]
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
        self.view.window?.windowController?.close()
    }
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
    
}
