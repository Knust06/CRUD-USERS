//
//  AddUserView.swift
//  UserController
//
//  Created by user226741 on 9/20/22.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var sobrenome : String = ""
    
    var body: some View {
        Form{
            Section{
                TextField("Username", text: $name)
                TextField("Sobrenome", text: $sobrenome)
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                
                
                HStack{
                    Button("Add User"){
                        DataController().addUser(name: name, email: email, sobrenome: sobrenome, password: password, context: managedObjectContext)
                        dismiss()
                    }//Button
                    Spacer()
                    
                }//HStack
            }//Section
        }//Form
        
        
    }//var
}//struct


