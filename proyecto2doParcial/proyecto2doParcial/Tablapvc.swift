//
//  Tablapvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 18/05/23.
//

import Cocoa

class Tablapvc: NSViewController {

    @objc dynamic var product: [RegisterProductosModel]=[]
    var idPersona:Int?
    var logincontroller = LoginController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
        imgShape.image = NSImage(named: logincontroller.getId(id: idPersona!).image)
        
    }
    
    @IBAction func btnVolver(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
    
}
