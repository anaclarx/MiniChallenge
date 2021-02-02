//
//  Tripulacao.swift
//  FeedTela
//
//  Created by Bruna Costa on 19/01/21.
//

import SwiftUI

struct Tripulacao: View {
    
    @State var showingModal = false
    @State var plus = false
    @ObservedObject private var appData = DAO.instance.appData
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    ScrollView (.vertical)
                    {
                        ForEach(appData.content,id: \.self ){content in
                        LazyVGridCell(content: content)
                            //criar publicacoes de acordo com o DAO e o append de newContent
                    }
                    }
                    .padding(.top, 10)
                }.navigationBarTitle("Tripulação")//.foregroundColor(Color("wideDinamic"))
                .navigationBarItems(trailing:
                                        Button(action: {
                                                    self.showingModal.toggle()
                                                }) {
                                            Image(systemName: "plus.circle").foregroundColor(Color("actionColor"))
                                                }.sheet(isPresented: $showingModal) {
                                                    NewContent( isPresented: $showingModal)
                                                }
                )
            }.background(Color("backgroundDinamic")
                            .ignoresSafeArea())
        }
    }
}

struct Tripulacao_Previews: PreviewProvider {
    static var previews: some View {
        Tripulacao()
    }
}

