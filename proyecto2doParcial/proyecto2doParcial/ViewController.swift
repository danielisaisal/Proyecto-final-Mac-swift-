//
//  ViewController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 04/05/23.
//

import Cocoa

class ViewController: NSViewController {

    var logincontroller = LoginController.shared
    var ventassController = VentasController.shared
    var flag:Bool?
    var mensaje:String?
    var idUser:Int?
    var rol:Int?
    var idpedidoU:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logincontroller.addUser(user: RegisterUserModel(0, "Luh", "Torres", "Martinez", "admin", 1234, "22/03/2000", 23, 4, NSColor.lightGray, "naranja"))
        color.wantsLayer = true
        color.layer?.backgroundColor = NSColor.lightGray.cgColor
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if(segue.identifier == "registroSinRol"){
            let destinationVC = segue.destinationController as! RegistroSinRolvc
        }
        if(segue.identifier == "menu"){
            let destinationVC = segue.destinationController as! Menuvc
            destinationVC.flag = flag
            destinationVC.mensaje = mensaje
            destinationVC.idPersona = idUser
            destinationVC.rol = rol
        }
        if(segue.identifier == "tablacliente"){
            let destinationVC = segue.destinationController as! tablapuvc
            destinationVC.clientPedidos = ventassController.pedidosCliente
            destinationVC.idPersona = idUser
        }
    }
    
    @IBAction func btnRegistroSinRol(_ sender: NSButton) {
        performSegue(withIdentifier: "registroSinRol", sender: self)
    }
    
    @IBAction func btnLogin(_ sender: NSButton) {
        if(txtUsuario.stringValue == "" || txtContrasena.stringValue == ""){
            lblMensaje.stringValue = "Campo vacio"
        }
        else{
            if(txtContrasena.stringValue == String(logincontroller.getPasswordAdmin()) && txtUsuario.stringValue == logincontroller.getUserAdmin()){
                rol = 4
                flag = true
                mensaje = "Usuario: \(logincontroller.getUserAdmin())  Rol: \(logincontroller.getRol(username: "admin").rol)"
                idUser = logincontroller.getRol(username: txtUsuario.stringValue).id
                performSegue(withIdentifier: "menu", sender: self)
                
            }
            if(logincontroller.getRol(username: txtUsuario.stringValue).rol == 2){
                rol = 2
                mensaje = "Usuario: \(logincontroller.getRol(username: txtUsuario.stringValue).email)  Rol: \(logincontroller.getRol(username: txtUsuario.stringValue).rol)"
                idUser = logincontroller.getRol(username: txtUsuario.stringValue).id
                performSegue(withIdentifier: "menu", sender: self)
            }
            if(logincontroller.getRol(username: txtUsuario.stringValue).rol == 3){
                rol = 3
                mensaje = "Usuario: \(logincontroller.getRol(username: txtUsuario.stringValue).email)  Rol: \(logincontroller.getRol(username: txtUsuario.stringValue).rol)"
                idUser = logincontroller.getRol(username: txtUsuario.stringValue).id
                performSegue(withIdentifier: "menu", sender: self)
            }
            if(logincontroller.getRol(username: txtUsuario.stringValue).rol == 1){
                flag = false
                idpedidoU = logincontroller.getRol(username: txtUsuario.stringValue).id
                ventassController.pedidosUsuario(id: idpedidoU!)
                idUser = logincontroller.getRol(username: txtUsuario.stringValue).id
                performSegue(withIdentifier: "tablacliente", sender: self)
            }
        }
        
    }
    
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var txtContrasena: NSTextField!
    @IBOutlet weak var txtUsuario: NSTextField!
    @IBOutlet weak var lblMensaje: NSTextField!
}

