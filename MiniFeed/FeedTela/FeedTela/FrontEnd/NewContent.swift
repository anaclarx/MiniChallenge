//
//  NewContent.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

//
//  NewContent.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

import SwiftUI
//Criando Modal de Adicionar Nova Publicação
struct NewContent: View {
    @ObservedObject private var appData = DAO.instance.appData
    @Environment(\.colorScheme) var colorScheme
    @State private var image : Image?
    @State private var showingImagePicker = false
    @State var show_modal: Bool = false
    @Binding var isPresented: Bool
    @State private var showingAlert = false
    
    @State var publishButtonEnable:Bool = false
    @State var publiText:String = ""
    @State var publiTitle:String = ""
    @State private var inputImage: UIImage?
    
    var content = Content.empty

    var body: some View {
        NavigationView{
            ZStack{
                Color("wideStatic").ignoresSafeArea(.all)
                
                ZStack{
//                    Rectangle().frame(width: UIScreen.main.bounds.width/1.1, height: 700, alignment: .center).foregroundColor(.white)
//                    VStack{
//                        Button(action: {self.showingImagePicker = true}){
//                            VStack{
//                                if image != nil{
//                                    VStack{
//                                        image?.renderingMode(.original).resizable().scaledToFit()
//                                        Text("Editar").font(.system(size:16)).foregroundColor(Color("actionColor"))
//                                    }
//                                }
//                                else{
//                                    ZStack{
//                                        Rectangle().frame(width: UIScreen.main.bounds.width/1.15, height: UIScreen.main.bounds.height/2.75, alignment: .center)
//                                            .foregroundColor(.white)
//                                        Rectangle().frame(width: UIScreen.main.bounds.width/1.25, height: UIScreen.main.bounds.height/3, alignment: .center)
//                                            .foregroundColor(.gray)
//                                            .opacity(0.5)
//                                        Capsule().foregroundColor(Color("actionColor")).overlay(Text("Colocar uma Foto").foregroundColor(.white))
//                                            .frame(width: 170, height: 50)
//                                            .shadow(color: Color("actionColor").opacity(0.8), radius: 10)
//                                    }
//                                }
//                            }
//                        }
//                        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//                            ImagePicker(image: self.$inputImage)
//                        }
//                        .padding()
                        Form{
                            Section(){
                                TextField("Toque para colocar um título", text: $publiTitle)
                                MultilineTextField("Toque aqui para colocar sua história e ajudar outros responsáveis a cuidarem das crianças!", text: $publiText.onUpdate {
                                    publishButtonEnable = !publiText.isEmpty

                                })
                            }
                        }.onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }//.navigationBarHidden(true)
                        //.navigationBarTitle("Nova Publicação", displayMode: .inline)
                        .navigationBarItems(leading:
                                                Button(action:
                                                        {self.isPresented = false}){
                                                    Text("Cancelar").foregroundColor(.white)},
                                            trailing:
                                                ActionButton(label: "Publicar!", width: 100, height: 30, isEnable: $publishButtonEnable, action: {
                                                    saveData()
                                                    self.isPresented = false
                                                })
                                                
                                            
                        )
                        
                    }
                }
            }
        }
    //TODO: resolver replicação ao clicar "Publicar!"mais de uma vez.
    func saveData() {
        self.content.publiText = publiText
        self.content.publiTitle = publiTitle
        self.appData.content.append(self.content)
        print(self.appData.content.count)
        //adiciona automaticamente o projeto no DAO
        Content.all[self.content.id] = self.content
        User.current.activities.addMyContent(id: self.content.id)

        
        
    }
    }
    


    
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//        self.content.UIImage = image // Resolver isso aqui
//    }
//}

struct NewContent_Previews: PreviewProvider {
    @State static var show_modal: Bool = false
    static var previews: some View {
        NewContent(isPresented: self.$show_modal)
    }
}



