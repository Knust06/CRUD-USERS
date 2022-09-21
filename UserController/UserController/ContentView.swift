//
//  ContentView.swift
//  UserController
//
//  Created by user226741 on 9/19/22.
//

import SwiftUI
import CoreData

struct ContentView : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order : .reverse)]) var user : FetchedResults<User>
    @State var isAddView : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(user) { user in
                    NavigationLink(destination: EditUserView(user: user)) {
                        HStack{
                            Text(user.name!)
                                .bold()
                            Text(user.sobrenome!)
                                .bold()
                            Text(user.email!)
                                .bold()
                            Text(user.password!)
                                .bold()
                        }//HStack
                        Spacer()
                        Text(calcTimeSince(date : user.date!))
                            .foregroundColor(.green)
                            .italic()
                        
                    }//NavigationLink
                    
                }//Foreach
                .onDelete(perform : deleteUser)
            }//list
            .listStyle(.plain)
            
        }//NavigationView
        
        .navigationTitle("Active Users")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    isAddView.toggle()
                }//Button
                label: {
                    Label("Add User", systemImage: "plus.circle")
                }//label
                
            }//ToolbarItem
            
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
                
            }//ToolbarItem
            
        }//toolbar
        .sheet(isPresented: $isAddView){
            AddUserView()
        }//sheet
        
        
    }//var body
    
    func deleteUser(offset: IndexSet){
        DataController().deleteUser(offsets: offset, context : managedObjectContext, user : user)
    }//deleteUser
    
}//View


struct UserDetailView : View {
    var userName : String = ""
    var userSobrenome : String = ""
    var userEmail : String = ""
    var userPassword : String = ""
    var userDate : Date = Date()
    
    
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 3){
                Text(userName)
                    .bold()
                Text(userSobrenome)
                    .bold()
                Text(userEmail)
                    .bold()
                Text(userPassword)
                    .bold()
                
            }//VStack
            Spacer()
            
            Text(calcTimeSince(date:userDate))
            
            
        }//HStack
    }//var body view
}//Struct View

    func calcTimeSince(date:Date) -> String {
        let minutes = Int(-date.timeIntervalSinceNow)/60
        let hours = minutes / 60
        let days = hours / 24
        
        if minutes < 120 {
            return "\(minutes) minutos atrás"
        }//if minutes
        else if (minutes >= 120 && hours < 48){
            return "\(hours) horas atrás"
        }//else if
        else {
            return "\(days) dias atrás"
        }//else
        
        
    }//calcTimeSince
    
   
    
    

