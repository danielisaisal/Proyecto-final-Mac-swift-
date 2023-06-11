//
//  registroConRol.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 15/05/23.
//

import Cocoa

class registroConRol: NSViewController {

    var anioPersona: Int = 0
    var anios: Int = 0
    var anioPresente: Int = 2023
    var fechaCompleta: String = ""
    var colores = ["Amarillo","Azul","Gris"]
    var items = ["azul","naranja","verde"]
    var loginController = LoginController.shared
    var cont = 0
    var cambioModuloUser:Bool?
    var posicion:Int!
    var idPersona:Int?
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        for item in items {
            cmbImage.addItem(withObjectValue: item)
            
        }
        
        for colore in colores {
            cmbChangeColor.addItem(withObjectValue: colore)
        }
        color.wantsLayer = true
        color.layer?.backgroundColor = loginController.getId(id: idPersona!).color.cgColor
        if(cambioModuloUser == true){
            txtEdad.isEnabled = false
            txtID.isEnabled = false
            btnModificar.isHidden = true
            txtEdad.stringValue = "0"
            cont = loginController.users.count + loginController.eliminados.count
            txtID.stringValue = "\(cont)"
            lblTitle.stringValue = "Alta"
            
        }
        else{
            btnAlta.isHidden = true
            lblTitle.stringValue = "Modificar"
            txtID.stringValue = "\(loginController.getId(id: posicion!).id)"
            txtRol.stringValue = "\(loginController.getId(id: posicion!).rol)"
            txtEdad.stringValue = "\(loginController.getId(id: posicion!).edad)"
            txtEmail.stringValue = "\(loginController.getId(id: posicion!).email)"
            txtNombre.stringValue = "\(loginController.getId(id: posicion!).nombre)"
            txtContrasena.stringValue = "\(loginController.getId(id: posicion!).password)"
            txtApellidoM.stringValue = "\(loginController.getId(id: posicion!).apellidoM)"
            txtApellidoP.stringValue = "\(loginController.getId(id: posicion!).apellidoP)"
            cmbImage.stringValue = "\(loginController.getId(id: posicion!).image)"
            cmbChangeColor.stringValue = "\(loginController.getId(id: posicion!).color)"
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "dd/MM/yyyy"
            datePicker.dateValue = dateFormatter.date(from: loginController.getId(id: posicion!).fechaNacimiento)!
            txtID.isEnabled = false
            txtEdad.isEnabled = false
            btnModificar.isEnabled = false
            
        }
    }
    
    @IBAction func btnAlta(_ sender: NSButton) {
        if(txtEdad.stringValue == "" || txtEmail.stringValue == "" || txtNombre.stringValue == "" || txtContrasena.stringValue == "" || txtApellidoM.stringValue == "" || txtApellidoP.stringValue == "" || txtVerificarContrasena.stringValue == ""){
            lblWarning.stringValue = "faltan campos por llenar"
        }
        else{
            if(txtContrasena.stringValue == txtVerificarContrasena.stringValue){
                if(txtRol.intValue <= 3 && txtRol.intValue >= 1){
                    loginController.addUser(user: RegisterUserModel(Int(txtID.intValue), txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, Int(txtContrasena.intValue), fechaCompleta, Int(txtEdad.intValue), Int(txtRol.intValue),colorPantallas(color: cmbChangeColor.stringValue), cmbImage.stringValue))
                    
                    self.view.window?.windowController?.close()
                }
                else{
                    lblWarning.stringValue = "Los roles disponibles son (1, 2 y 3)"
                }
            }
            else{
                lblWarning.stringValue = "No coinsiden las contrasenas"
            }
            
        }
    }
    
    
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtContrasena: NSTextField!
    @IBOutlet weak var txtVerificarContrasena: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var datePicker: NSDatePicker!
    @IBOutlet weak var txtEdad: NSTextField!
    @IBOutlet weak var lblWarning: NSTextField!
    @IBOutlet weak var lblTitle: NSTextField!
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var txtRol: NSTextField!
    @IBOutlet weak var btnModificar: NSButton!
    @IBOutlet weak var btnAlta: NSButton!
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var cmbImage: NSComboBox!
    @IBOutlet weak var cmbChangeColor: NSComboBox!
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    @IBAction func btnModificar(_ sender: NSButton) {
        id = Int(txtID.intValue)
        var apellidoM:String = txtApellidoM.stringValue
        var apellidoP:String = txtApellidoP.stringValue
        var edad:Int = Int(txtEdad.intValue)
        var email:String = txtEmail.stringValue
        var fechaN:String = datePicker.stringValue
        var nombre = txtNombre.stringValue
        var password = Int(txtContrasena.intValue)
        var rol = Int(txtRol.intValue)
        
        loginController.getId(id: id).apellidoM = apellidoM
        loginController.getId(id: id).apellidoP = apellidoP
        loginController.getId(id: id).edad = edad
        loginController.getId(id: id).email = email
        loginController.getId(id: id).fechaNacimiento = fechaCompleta
        loginController.getId(id: id).nombre = nombre
        loginController.getId(id: id).password = password
        loginController.getId(id: id).rol = rol
        loginController.getId(id: id).color = colorPantallas(color: cmbChangeColor.stringValue)
        loginController.getId(id: id).image = cmbImage.stringValue
        
        self.view.window?.windowController?.close()
    }
    
    @IBAction func datePickerValueChanged(_ sender: NSDatePicker) {
            extractDateFromPicker(datePicker: sender)
        btnModificar.isEnabled = true
    }
    
    //Funciones
        func extractDateFromPicker(datePicker: NSDatePicker) {
            anios = 0
            
            let calendar = NSCalendar.current
            let selectedDate = datePicker.dateValue
            
            let year = calendar.component(.year, from: selectedDate)
            anioPersona = year
            let month = calendar.component(.month, from: selectedDate)
            let day = calendar.component(.day, from: selectedDate)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let formattedDate = dateFormatter.string(from: selectedDate as Date)
            
            fechaCompleta = "\(formattedDate)"
            anios = anioPresente - anioPersona
            txtEdad.stringValue = "\(anios)"
        }
    
    func colorPantallas(color:String) -> NSColor {
        switch(color){
            case "Amarillo":
            return NSColor.systemYellow
            break
        case "Azul":
            return NSColor.systemCyan
        case "Gris":
            return NSColor.darkGray
        default:
            break
        }
        return NSColor.white
    }
}
