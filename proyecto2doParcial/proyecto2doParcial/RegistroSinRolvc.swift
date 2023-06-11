//
//  RegistroSinRolvc.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 11/05/23.
//

import Cocoa

class RegistroSinRolvc: NSViewController {
    
    var anioPersona: Int = 0
    var anios: Int = 0
    var anioPresente: Int = 2023
    var fechaCompleta: String = ""
    var colores = ["Amarillo","Azul","Gris"]
    var items = ["azul","naranja","verde"]
    var loginController = LoginController.shared
    var cont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in items {
            cmbImage.addItem(withObjectValue: item)
            
        }
        
        for colore in colores {
            cmbColor.addItem(withObjectValue: colore)
        }
        txtEdad.isEnabled = false
        txtID.isEnabled = false
        txtEdad.stringValue = "0"
        cont = loginController.users.count + loginController.eliminados.count
        txtID.stringValue = "\(cont)"
        color.wantsLayer = true
        color.layer?.backgroundColor = NSColor.lightGray.cgColor
        // Do view setup here.
    }
    
    @IBAction func btnRegistrar(_ sender: NSButton) {
        if(txtEdad.stringValue == "" || txtEmail.stringValue == "" || txtNombre.stringValue == "" || txtContrasena.stringValue == "" || txtApellidoM.stringValue == "" || txtApellidoP.stringValue == "" || txtVerificarContrasena.stringValue == ""){
            lblWarning.stringValue = "faltan campos por llenar"
        }
        else{
            if(txtContrasena.stringValue == txtVerificarContrasena.stringValue){
                loginController.addUser(user: RegisterUserModel(Int(txtID.intValue), txtNombre.stringValue, txtApellidoP.stringValue, txtApellidoM.stringValue, txtEmail.stringValue, Int(txtContrasena.intValue), fechaCompleta, Int(txtEdad.intValue), 1, colorPantallas(color: cmbColor.stringValue), cmbImage.stringValue))
                
                self.view.window?.windowController?.close()
            }
            else{
                lblWarning.stringValue = "No coinsiden las contrasenas"
            }
            
        }
    }
    
    func colorPantallas(color:String) -> NSColor {
        switch(color){
            case "Amarillo":
            return NSColor.systemYellow
        case "Azul":
            return NSColor.systemCyan
        case "Gris":
            return NSColor.darkGray
        default:
            break
        }
        return NSColor.white
    }
    
    
    
//IBOutlest y actions
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoP: NSTextField!
    @IBOutlet weak var txtApellidoM: NSTextField!
    @IBOutlet weak var txtContrasena: NSTextField!
    @IBOutlet weak var txtVerificarContrasena: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var datePicker: NSDatePicker!
    @IBOutlet weak var txtEdad: NSTextField!
    @IBOutlet weak var lblWarning: NSTextField!
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var color: NSView!
    @IBOutlet weak var cmbColor: NSComboBox!
    @IBOutlet weak var cmbImage: NSComboBox!
    
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    @IBAction func datePickerValueChanged(_ sender: NSDatePicker) {
            extractDateFromPicker(datePicker: sender)
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
    
}
