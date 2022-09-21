//
//  EditUserView.swift
//  UserController
//
//  Created by user226741 on 9/20/22.
//

import SwiftUI

struct EditUserView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    @State var name : String = ""
    @State var sobrenome : String = ""
    @State var email : String = ""
    @State var password : String = ""
    
    var user : FetchedResults<User>.Element
    
    var body: some View {
        Form {
            Section{
                TextField("Username", text: $name)
                TextField("Sobrenome", text: $sobrenome)
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                
                HStack{
                    Button("Editar"){
                        DataController().editUser(userOld: user, name: self.name, email: self.email, sobrenome: self.sobrenome, password: self.password, context: managedObjectContext)
                        
                        dismiss()
                    }
                    
                }//HStack
            }//Section
            
        }//Form
        
    }//var body
}//struct edituserview

