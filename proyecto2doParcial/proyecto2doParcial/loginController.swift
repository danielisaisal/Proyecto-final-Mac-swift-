//
//  loginController.swift
//  proyecto2doParcial
//
//  Created by DANIEL SALDANA on 15/05/23.
//

import Foundation

class LoginController{
    var users = [RegisterUserModel]()
    var eliminados = [Int]()
    
    static var shared: LoginController = {
        let instance = LoginController()
        return instance
    }()
    
    func addUser(user:RegisterUserModel) {
        users.append(user)
    }
    
    func getUserAdmin () -> String{
        return users[0].email
    }
    
    func getPasswordAdmin () -> Int{
        return users[0].password
    }
    
    func getRol (username:String) -> RegisterUserModel{
        for user in users {
            if user.email == username{
                return user
            }
        }
        return users[0]
    }
    
    func getRol (id:Int) -> RegisterUserModel{
        for user in users {
            if user.id == id{
                return user
            }
        }
        return users[0]
    }
    
    func getId (id:Int) -> RegisterUserModel{
        for user in users {
            if user.id == id{
                return user
            }
        }
        return users[0]
    }
    
    func validacionAdmin (id:Int) -> Bool{
        for user in users {
            if user.id == id{
                return true
            }
        }
        return false
    }
    
    func addEliminado() {
        eliminados.append(1)
    }
}
