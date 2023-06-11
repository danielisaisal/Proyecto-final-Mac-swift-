//
//  Tablacvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 20/05/23.
//

import Cocoa

class Tablacvc: NSViewController {

    @objc dynamic var compra: [RegisterComprasModel]=[]
    var idPersona:Int?
    var logincontroller = LoginController.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        color.wantsLayer = true
        color.layer?.backgroundColor = logincontroller.getId(id: idPersona!).color.cgColor
        imgShape.image = NSImage(named: logincontroller.getId(id: idPersona!).image) 
    }
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var imgShape: NSImageView!
}
