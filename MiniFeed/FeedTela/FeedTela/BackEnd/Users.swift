//
//  Users.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

import Foundation
import Foundation

class User: Identifiable, ObservableObject {
    let id: UUID
    var recordName:String?
    var name: String
    var email: String
    var senha: String
    var dataNasc : String
    var activities: UserActivity
    
    static var current: User {
        return DAO.instance.appData.loggedUser ?? User.empty
    }
    
    static var empty : User{
        return User(name: "", email: "", senha: "", dataNasc: "")
    }
    
    static var all: [UUID:User] = [:]
    
    init(name: String, email: String, senha: String = "", dataNasc: String){
        let id = UUID() //pq aq e la em cima tb?
        self.id = id
        self.name = name
        self.email = email
        self.senha = senha
        self.dataNasc = dataNasc
        self.activities = UserActivity(idUser: id)
        Self.all[id] = self
    }
}
