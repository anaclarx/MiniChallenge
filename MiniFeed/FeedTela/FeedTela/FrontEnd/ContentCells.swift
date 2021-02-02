//
//  ContentCells.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

import Foundation
import SwiftUI
import UIKit
struct ContentCells: View {
    //@State private var colors: UIImageColors = UIImageColors(background: .clear, primary: .clear, secondary: .clear, detail: .clear)
    var content: Content
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
           
  
            }
        }
    }
}

struct ContentCells_Previews: PreviewProvider {
    static var previews: some View {
        ContentCells(content: DAO.instance.appData.content[0])
    }
}

//struct NewDetailedProject: View {
//    @State private var colors: UIImageColors = UIImageColors(background: .clear, primary: .clear, secondary: .clear, detail: .clear)
//    var project: Project
//    @State var isFav : Bool
//
//    var body: some View {
//        GeometryReader{ g in
//            ScrollView(showsIndicators: false) {
//                VStack(alignment: .leading, spacing: 0){
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.clear)
//                            .onAppear{
//                                self.colors = UIImage(named: self.project.image)!.getColors()!
//                        }
//                        .background(LinearGradient(gradient: Gradient(colors: [Color(self.colors.background), .clear]), startPoint: .top, endPoint: .bottom))
//                        self.createProjectImage()
//                    }
//                    Group{
//                        self.createTitle()
//                        self.createAuthorName()
//                        HStack(alignment: .bottom){
//                            self.createCategoriesList()
//                            Spacer()
//                            if !User.current.activities.myProjectsId.contains(self.project.id){
//                                Button(action:{}){
//                                    Image(systemName: "plus.bubble")
//                                        .resizable()
//                                        .frame(width: 25, height: 25, alignment: .bottomTrailing)
//                                }.padding(.trailing, 10)
//                                Button(action:{
//                                    self.isFav.toggle()
//                                    if self.isFav{
//                                        User.current.activities.addFavProject(id: self.project.id)
//                                    }
//                                    else{
//                                        User.current.activities.deleteFavProject(id: self.project.id)
//                                    }
//                                }){
//                                    if(self.isFav){
//                                        Image(systemName: "heart.fill")
//                                            .resizable()
//                                            .frame(width: 25, height: 25, alignment: .bottomTrailing)
//                                    }
//                                    else{
//                                        Image(systemName: "heart")
//                                            .resizable()
//                                            .frame(width: 25, height: 25, alignment: .bottomTrailing)
//                                    }
//
//                                }
//                            }
//                        }
//                        .padding(.bottom)
//                        self.createDescription()
//                            .padding(.bottom, 20)
//                        self.createProfessor()
//                            .padding(.bottom, 20)
//                        self.createSubject()
//                            .padding(.bottom, 20)
//                        Text("Vagas")
//                            .font(.system(size: 20, weight: .semibold, design: .rounded))
//                            .foregroundColor(.primary)
//                            .padding(.bottom, 5)
//                    }.padding(.horizontal)
//                    JobsList(project: self.project)
//                    .frame(height: g.size.height - 300)
//
//                }
//            }
//            .navigationBarItems(trailing:
//                 Button(action:{})
//                {
//                    if User.current.activities.myProjectsId.contains(self.project.id){
//                        Text("Editar")
//                    }
//                    else{
//                        EmptyView()
//                    }
//                })
//        }
//    }
//
//
//    fileprivate func createProjectImage() -> some View {
//        if project.image == "Imagem"{
//            return
//                project.UIImage!
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(maxHeight: 300)
//
//        }
//        else{
//            return
//                Image(uiImage: (UIImage(named: project.image))!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(maxHeight: 300)
//
//        }
//
//    }
//
//    fileprivate func createTitle() -> some View {
//        return Text(project.name)
//            .font(.system(size: 35, weight: .black, design: .rounded))
//            .layoutPriority(1)
//            .multilineTextAlignment(.leading)
//            .lineLimit(nil)
//    }
//
//    fileprivate func createAuthorName() -> some View{
//        return Text(self.project.author.name)
//                    .font(.system(size: 23, weight: .regular, design: .rounded))
//                    .opacity(0.56)
//    }
//
//    fileprivate func createCategoriesList() -> some View {
//        return ScrollView(.horizontal) {
//            HStack{
//                Text(project.handleCategories())
//                    .padding(.trailing, 5)
//                    .cornerRadius(10)
//                    .foregroundColor(Color.secondary)
//            }
//        }
//    }
//
//    fileprivate func createDescription() -> some View {
//        return
//                Text(self.project.description)
//                .font(.system (size: 17, weight: .regular))
//                    .lineLimit(nil)
//                    .multilineTextAlignment(.leading)
//    }
//
//    fileprivate func createProfessor() -> some View {
//        return
//            VStack(alignment: .leading){
//                Text("Professor")
//                    .font(.system(size: 17, weight: .semibold, design: .rounded))
//                    .foregroundColor(.primary)
//                Text(project.professor)
//                    .layoutPriority(2)
//                    .lineLimit(nil)
//                    .font(.system (size: 17, weight: .regular))
//                    .multilineTextAlignment(.leading)
//            }
//    }
//
//    fileprivate func createSubject() -> some View {
//        return
//            VStack(alignment: .leading){
//                Text("Disciplina")
//                    .font(.system(size: 17, weight: .semibold, design: .rounded))
//                    .foregroundColor(.primary)
//                Text(project.subject)
//                    .layoutPriority(2)
//                    .lineLimit(nil)
//                    .font(.system (size: 15, weight: .regular))
//                    .multilineTextAlignment(.leading)
//        }
//    }
//}
//
//struct NewDetailedProject_Previews: PreviewProvider {
//    static var previews: some View {
//        NewDetailedProject(project: DAO.instance.appData.projects[0], isFav: User.current.activities.favProjectsId.contains(DAO.instance.appData.projects[3].id) ? true : false)
//    }
//}
