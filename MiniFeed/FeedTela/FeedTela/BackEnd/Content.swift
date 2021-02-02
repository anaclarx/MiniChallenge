//
//  Content.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//


import Foundation
import SwiftUI
class Content: ObservableObject, Identifiable, Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Content, rhs: Content) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var publiTitle: String
    var publiText: String
    var publiImage: String
    var UIImage : Image?
    var author: User
    static var all: [UUID:Content] = [:]
    static var empty: Content{
        return Content(title: "", text: "", image:"",author: User.current)
    }
    static var todos: [UUID:Content] = [:]
    var isPubliTextValid : Bool{
        if publiText == ""{
            return false
        }
        return true
    }
    init(title: String, text: String, image: String,author: User) {
        self.publiTitle = title
        self.publiText = text
        self.publiImage = image
        self.author = author
        if isPubliTextValid{
            Self.todos[id] = self
            addProjectToCurrentUser(usuario: author)
        }

    }
    func addProjectToCurrentUser(usuario: User){
        usuario.activities.myContentId.append(self.id)
    }
  
}

