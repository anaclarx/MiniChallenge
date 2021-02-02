//
//  DAO.swift
//  Feed
//
//  Created by Ana Clara Filgueiras Granato on 08/01/21.
//

import Foundation
class AppData: Identifiable, ObservableObject{
    @Published var content: [Content] = []
    var loggedUser : User?
    var users : [User] = []
}
class DAO: Identifiable{
    static var instance = DAO()
    @Published var appData = AppData()
    private init(){
        createUsers()
        createContent()
        appData.loggedUser = appData.users[0]
    }
    func createUsers() {
        appData.users.append(User(name: "Maria Furtado", email: "mf@gmail.com", senha: "MariaFurtado", dataNasc: "12/01/2001"))
    }
    func createContent(){
        appData.content.append(Content(title: "Diversidade", text: "Crio meu filho sozinha, sempre tive um certa dificuldade de abordar temas relacionados a diversidade pelo ciclo de adultos que compõe a vida de meu filho serem majoritariamente héteros e brancos. Ele começou a escola esse mês e veio me perguntar porque seu amiguinho tinha duas mamães, e travei na hora. Fui perguntar para umas amigas como poderia conversar sobre isso com ele e elas me recomendaram o Kosmos! Além de conversar com ele de um jeito que eu sei que é eficiente ainda vou poder conversar de outros tópicos abordados no aplicativo que eu nunca havia pensando na importância. ", image: "bao", author: appData.users[0]))
        appData.content.append(Content(title: "Papéis", text: "Meu filho está em uma fase de fazer várias perguntas! Ontem ele pediu algo ao seu avô que normalmente eu que tomo conta. Lembrei que no Kosmos tinha um módulo sobre papéis e fui dar uma olhada para explicar direitinho pro meu filho que na nossa família existem algumas coisas que só a mamãe e o papai podem fazer. Ele entendeu super bem! Gratidão!", image: "bao", author: appData.users[0]))
        appData.content.append(Content(title: "Valores:", text: "Cresci em uma família com muitas tradições, almoços de domingo são sagrados. Esses dias minha filha não queria sair de casa para ver seu desenho. Odeio impor coisas sob a minha filha então tentei explicar que sempre foi um costuma na nossa família e que era importante manter o contato com a família. Consegui isso com o Kosmos e estaria perdidinha sem ele!", image: "bao", author: appData.users[0]))
        appData.content.append(Content(title: "Importância", text: "Cresci em uma família muito conservadora, e tento criar meus filho fora do espaço que eu cresci. Queria que quando eles pensassem em família viesse segurança, amor e carinho e suas mentes. Tive muita dificuldade no começo pois estava apegada a minha criação e quando percebi isso me bateu ansiedade e desespero. Fui olhar no google dicar e livros entretanto fiquei com medo de não criar o hábito. Com o Kosmos, consegui abordar assuntos e mudar o jeito que eu ajo em torno deles de modo simples e leve, por ser um conteúdo extremamente acessível. Recomendo para todas as mão solteiras ou não que conheço hoje em dia. Essencial.", image: "bao", author: appData.users[0]))
    }
    
}
//    func createProjects(){
//        appData.projects.append(Project(name: "Aventura Mágica", author: appData.users[0], categories: ["Jogos","infantil"], description: "Um jogo de aventura para crianças com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador para me auxiliar com o desenvolvimento deste projeto.", image: "lampada", jobs: [appData.jobs[0]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "NanoRobots", author: appData.users[1], categories: ["Tecnologia","robos"], description: "Um jogo de aventura para crianca com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador e um artista visual para me auxiliarem com o desenvolvimento deste projeto, que é o meu projeto de conclusão em design.", image: "robot", jobs: [appData.jobs[0]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "Daisy", author: appData.users[1], categories: ["Jogos","flores"], description: "Um jogo de aventura para crianca com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador e um artista visual para me auxiliarem com o desenvolvimento deste projeto, que é o meu projeto de conclusão em design.", image: "flower", jobs: [appData.jobs[1]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "Fazenda Feliz", author: appData.users[3], categories: ["Jogos","animais"], description: "Um jogo relaxante com animais com o objetivo de cuidado animal, para conscientizar sobre a crueldade animal, envolvendo relxamento e criação de empatia com todas as crituras. Estou à procura de um artista visual para me auxiliar com o desenvolvimento deste projeto.", image: "bird", jobs: [appData.jobs[3], appData.jobs[2]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//    }
//import Foundation
//
//class AppData: Identifiable, ObservableObject{
//    var projects : [Project] = []
//    var users : [User] = []
//    var jobs : [Job] = []
//    var published : [Project] = []
//    var loggedUser : User?
//}
//
//
//class DAO: Identifiable{
//
//    static var instance = DAO()
//
//    @Published var appData = AppData()
//
//    private init(){
//        createUsers()
//        createJobs()
//        createProjects()
//        appData.projects[3].addCollaborator(collaborator: appData.users[1])
//        appData.projects[3].addCollaborator(collaborator: appData.users[0])
//        appData.loggedUser = appData.users[2]
//        //Project.all[appData.loggedUser!.activities.myProjectsId[0]]!.jobs[0].occupyJob(id: appData.users[0].id)
//    }
//
//    func createUsers() {
//        appData.users.append(User(name: "Maria Furtado", email: "mf@gmail.com", image: "MariaFurtado", course: "Design de Midia Digital", university: "PUC-Rio", semester:"7", interests: ["Jogos","Desenho","Animação"]))
//        appData.users.append(User(name: "Sofia Gomes", email: "sg@gmail.com", image: "SofiaGomes", course: "Computação", university: "PUC-Rio", semester: "7", interests: ["Jogos","Animação"]))
//        appData.users.append(User(name: "Caio Henrique", email: "ch@gmail.com", image: "Caio", course: "Design de Comunicação Visual", university: "PUC-Rio", semester: "5", interests: ["Jogos","Desenho","Animação"]))
//        appData.users.append(User(name: "Julia Ferreira", email: "jf@gmail.com", image: "Julia", course: "Engenharia de Computação", university: "PUC-Rio", semester: "4", interests: ["Jogos","Desenho","Animação"]))
//    }
//
//    func createJobs(){
//        appData.jobs.append(Job(name: "Programador", workload: ["2","7"], description: "Programador de Jogos em Unity"))
//        appData.jobs.append(Job(name: "Ilustrador", workload: ["1","7"], description: "Ilustrador dos sprites do Jogo"))
//        appData.jobs.append(Job(name: "Sonorizador", workload: ["2","7"], description: "Fazer a Sonorização do Jogo"))
//        appData.jobs.append(Job(name: "Ilustrador", workload: ["2","7"], description: "Construção Visual do jogo"))
//    }
//
//    func createProjects(){
//        appData.projects.append(Project(name: "Aventura Mágica", author: appData.users[0], categories: ["Jogos","infantil"], description: "Um jogo de aventura para crianças com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador para me auxiliar com o desenvolvimento deste projeto.", image: "lampada", jobs: [appData.jobs[0]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "NanoRobots", author: appData.users[1], categories: ["Tecnologia","robos"], description: "Um jogo de aventura para crianca com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador e um artista visual para me auxiliarem com o desenvolvimento deste projeto, que é o meu projeto de conclusão em design.", image: "robot", jobs: [appData.jobs[0]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "Daisy", author: appData.users[1], categories: ["Jogos","flores"], description: "Um jogo de aventura para crianca com o objetivo de ensinar conceitos básicos de comunicação visual. Estou à procura de um programador e um artista visual para me auxiliarem com o desenvolvimento deste projeto, que é o meu projeto de conclusão em design.", image: "flower", jobs: [appData.jobs[1]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//        appData.projects.append(Project(name: "Fazenda Feliz", author: appData.users[3], categories: ["Jogos","animais"], description: "Um jogo relaxante com animais com o objetivo de cuidado animal, para conscientizar sobre a crueldade animal, envolvendo relxamento e criação de empatia com todas as crituras. Estou à procura de um artista visual para me auxiliar com o desenvolvimento deste projeto.", image: "bird", jobs: [appData.jobs[3], appData.jobs[2]], professor: "Marcelo Pereira", subject: "Projeto 7"))
//    }
//}
