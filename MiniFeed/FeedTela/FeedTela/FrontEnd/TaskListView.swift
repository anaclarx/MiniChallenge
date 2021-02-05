//
//  ContentView.swift
//  FeedTela
//
//  Created by Bruna Costa on 19/01/21.
//

import SwiftUI


struct Task: Identifiable
{
    var id: String = UUID().uuidString
    var title: String
    //var completed: Bool
}


var testDataTasks = [
    Task(title: "É suspeita ou está enviando spam."),//, completed: false),
    Task(title: "É abusiva ou nociva."),//, completed: false),
    Task(title: "Manifesta intenções de automutilação ou suicídio."),//, completed: false),
    Task(title: "Viola as boas práticas de uso do Kosmos."),//, completed: false),//, completed: false)
]

struct TaskListView: View {
    
    @State var report = false
    @State var terms = false
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    var tasks: [Task] = testDataTasks // (1)
    
    var body: some View {
        // (2)
        ZStack{
            Color("highDinamic").ignoresSafeArea(.all)
        VStack(alignment: .leading) {
            Text("Ajude-nos a entender o problema. O que está acontecendo com essa publicação?")
                .foregroundColor(Color("lowDinamic"))
                .fontWeight(.bold)
                .padding()
                .padding(.top, 32)
                ForEach (self.tasks) { task in // (3)
                    
                    TaskCell(task: task) // (6)
                }.padding().listRowBackground(Color("highDinamic"))
            
            HStack{
                Spacer()
                VStack{
                    
                    Button(action: {
                        self.report.toggle()
                        self.showingAlert = true
                    }) {
                        
                        Capsule().foregroundColor(Color("actionColor")).overlay(
                            Text ("Reportar").foregroundColor(Color("lowDinamic")))
                            .frame(width: 100, height: 40)
                            .shadow(color: Color("actionColor").opacity(0.8), radius: 10)
                            .padding(.top, 10)
                            
                            
                    }.padding(.bottom, 32)
                    .alert(isPresented: $showingAlert){
                        Alert(title:Text("Obrigado por reportar!"), message:Text("Vamos analisar e tomar as medidas necessárias!"), dismissButton: .default(Text("OK!"),action:{self.presentationMode.wrappedValue.dismiss()}))
                    }
                   //.sheet(isPresented: $report) {
                        //ThankU()
                
                        Button(action: {
                            self.terms.toggle()
                        }) {
                            ZStack{
                            Capsule().foregroundColor(Color("positiveColor"))
                                .frame(width: 250, height: 40)
                                .shadow(color: Color("highDinamic").opacity(0.8), radius: 10)
                                .padding(.top, 10)
                            
                            Capsule().foregroundColor(Color("highDinamic")).overlay(
                                Text ("Termos de Uso do Kosmos").foregroundColor(Color("positiveColor")).shadow(color: Color("positiveColor"), radius: 5))
                                .frame(width: 245, height: 35)
                                .shadow(color: Color("positiveColor").opacity(0.8), radius: 10)
                                .padding(.top, 10)
                            }
                        }.sheet(isPresented: $terms) {
                            Publish()
                        }
                    Spacer()
                }.padding(.top, 50)
                Spacer()
            }
        }
        }
    }
    
    
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View { // (5)
    
    var task: Task
    @State var check = false
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                self.check.toggle()
            }) {
                Image(systemName: check ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("lowDinamic"))
            }// (12)
            Text(task.title).foregroundColor(Color("lowDinamic"))
        }
    }
}
