//
//  UserActivity.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

import Foundation
class UserActivity: Identifiable{
    let id = UUID()
    let idUser: UUID
    var myContentId: [UUID] = []
    
    
    init(idUser: UUID){
        self.idUser = idUser
    }
    
    func addMyContent(id: UUID){
           self.myContentId.append(id)
       }
       
    func deleteMyContent(id: UUID){
           self.myContentId.removeAll(where: {$0 == id})
       }
}


