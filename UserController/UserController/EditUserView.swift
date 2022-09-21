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
                TextField("Name", text: $name)
                TextField("Sobrenome", text: $sobrenome)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                TextField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    .onAppear(){
                        if let name = user.name {
                            self.name = name
                        }
                        if let sobrenome = user.sobrenome {
                            self.sobrenome = sobrenome
                        }
                        if let email = user.email {
                            self.email = email
                        }
                        if let password = user.password {
                            self.password = password
                        }
                        
                    }//onAppear
                
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

