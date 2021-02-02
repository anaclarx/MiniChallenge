//
//  LazyVGrid.swift
//  FeedTela
//
//  Created by Bruna Costa on 21/01/21.
//

import SwiftUI
import SwiftUI

struct LazyVGridCell: View {
    var content: Content
    
    @State var isShowingContent: Bool = true
    
    @State private var isExpanded: Bool = false
    
    @ObservedObject private var appData = DAO.instance.appData
    
    //var symbols = ["brasilFull", "mitosFull", "fundo"] //tava private var e a de baixo tambem
    
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 20) {
                
                Button(action: {
                    isExpanded.toggle()
                }) {
                ZStack{
                    VStack{
                        HStack{
                            Text(content.publiTitle).fontWeight(.bold).padding()
                            Spacer()
                        }
//                        Image(content.publiImage)//.padding()
//                        HStack
                        
                        Text(content.publiText).padding()
                            //relacionando o DAO com a celulas usando um counter que vem da view tripulacao
                            
                            
                            .lineLimit(isExpanded ? nil : 2)
                            Spacer()
                        }
                    }
                    
                }.background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(.white))
                                .shadow(radius: 5)).padding()
        
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }


//struct LazyVGridCell: View {
//    var content: Content
//
//    @State var isShowingContent: Bool = true
//
//    @State private var isExpanded: Bool = false
//
//    @State private var actionSheetAction: Bool = false
//
//    @State var actionViewMode = ActionViewMode.first
//
//    @State var isMainActionPresented = false
//
//    @State var isActionViewPresented = false
//
//
//    //@ObservedObject private var appData = DAO.instance.appData
//
//    //var symbols = ["brasilFull", "mitosFull", "fundo"] //tava private var e a de baixo tambem
//
//    var gridItemLayout = [GridItem(.flexible())]
//
//    var body: some View {
//        NavigationView{
//        ScrollView {
//            LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 20) {
//
//                Button(action: {
//                    isExpanded.toggle()
//                }) {
//                ZStack{
//                    VStack{
//                        HStack{
//                            Text(content.publiTitle).fontWeight(.bold).padding()
//                            Spacer()
//                            Button(action: {
//                                actionSheetAction.toggle()
//                            }) {
//                                Text("...").fontWeight(.bold).foregroundColor(Color("actionColor")).padding()
//                            }.actionSheet(isPresented: $actionSheetAction) {
//                                ActionSheet(title: Text("Mais opções"), buttons: [
//                                    .destructive(Text("Denunciar"),
//                                    action: {
//                                        self.actionViewMode = .first
//                                        self.isActionViewPresented = true
//                                }),
//                                    .default(Text("Compartilhar")),
//                                    .cancel()
//                                ])
//                            }.sheet(isPresented: $isActionViewPresented) {
//                                self.actionViewMode.view
//                            }
//                        }
//                        Image(content.publiImage)//.padding()
//                        HStack
//                        {
//                        Text(content.publiText).padding()
//                            //relacionando o DAO com a celulas usando um counter que vem da view tripulacao
//
//
//                            .lineLimit(isExpanded ? nil : 2)
//                            Spacer()
//                        }
//                    }
//
//                }.background(RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                .fill(Color(.white))
//                                .shadow(radius: 5)).padding()
//
//
//                }.buttonStyle(PlainButtonStyle())
//            }
//        }.navigationBarHidden(true)
//        }
//    }
//}

enum ActionViewMode {
    case first
}

//extension ActionViewMode {
//    var view: some View {
//        switch self {
//            case .first: return TaskListView()
//        }
//    }
//}

struct LazyVGridCell_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridCell(content: Content(title: "Diversidade", text: "Como o kosmos ajudou meu filho piruzito", image: "bao", author: User.current))
    }
}
