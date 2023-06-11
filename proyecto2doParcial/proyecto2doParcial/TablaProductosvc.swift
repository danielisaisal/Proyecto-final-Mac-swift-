//
//  TablaProductosvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 16/05/23.
//

import Cocoa

class TablaProductosvc: NSViewController {

    @objc dynamic var product: [RegisterProductosModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func btnVolver(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
}
