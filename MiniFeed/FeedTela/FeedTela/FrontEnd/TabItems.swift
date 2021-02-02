//
//  TabView.swift
//  MiniFeed
//
//  Created by Ana Clara Filgueiras Granato on 02/02/21.
//

import SwiftUI

struct TabItems: View {
    var body: some View {
        TabView{
            Tripulacao().tabItem ({
                Image(systemName: "signpost.right").font(.none)
                Text("Tripulação")
            }).tag(0)
        }.accentColor(Color("actionColor"))
    }
}

struct TabItems_Previews: PreviewProvider {
    static var previews: some View {
        TabItems()
    }
}
//var body: some View {
//
//    //MARK: Iniciando criação de TabBar //
//    TabView{
//
//        //Criamos primeiro o direcionamento na TabBar.
//        //Primeiro escolhemos a tela que ele vai, depois o icone e o texto do botão e em seguida a ordem desses elementos na TabBar.
//
//        //Selecionamos a View que queremos redirecionar o usuário//
//        NovaTrilhaView().tabItem({
//
//            //Escolhendo o icone da TabBar, nesse caso a imagem do SFSymbols com nome "book"//
//            Image(systemName: "signpost.right").font(.none)
//
//            //Escolhendo o texto abaixo do icone da TabBar//
//            Text("Trilha")
//
//            //Adicionando a Ordem do Elemento na Tab Bar, nesse caso o 0 represena o primeiro icone//
//        }).tag(0)
//
//        //QAView().tabItem({
//        //  Image(systemName: "questionmark.diamond").font(.none)
//        //   Text("QA")
//        //}).tag(1)
//
//
//        DisqueView().tabItem({
//            Image(systemName: "exclamationmark.bubble").font(.none)
//            Text("Proteja")
//        }).tag(2)
//
//
//    }.accentColor(Color("actionColor"))//Mudar Cor dos elementos da Tab Bar
//    //        .sheet(isPresented: self.$show_onboarding){
//    //            OnBoardingView(show_onboarding: $show_onboarding)
//    //
//    //        }
//    .onAppear(){
//        show_onboarding = UserDefaults.standard.value(forKey: "didLaunchBefore") as? Bool ?? true
//    }
//    .fullScreenCover(isPresented: self.$show_onboarding, content: {
//        OnBoardingView(show_onboarding: $show_onboarding)
//    })
//}
