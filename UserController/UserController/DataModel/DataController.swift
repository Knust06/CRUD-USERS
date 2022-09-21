//
//  DataController.swift
//  UserController
//
//  Created by user226741 on 9/20/22.
//

import Foundation
import CoreData
import SwiftUI


class DataController : ObservableObject {
    
    let container = NSPersistentContainer(name: "User")
    
    init(){
        container.loadPersistentStores{description, error in
            if let errorIfLet = error{
                print("Erro ao carregar os dados :/ \(errorIfLet)")
            }//if let
        }//load Persistent
    }//init
    
    func save(context: NSManagedObjectContext){
        do {try context.save()
            
        }//do
        catch {
            let error = error as NSError
            print("Erro ao salvar os dados no contexto :/ \(error)")
        }//catch
    }//save
    func update(){
            
        }//update
        
    func addUser(name: String, email: String, sobrenome: String, password: String,context:NSManagedObjectContext){
        let user = User(context: context)
        
        user.name = name
        user.sobrenome = sobrenome
        user.id = UUID()
        user.date = Date()
        user.email = email
        user.password = password
        
        save(context: context)
        
    }//addUser
        
    func editUser(userOld: User, name: String, email: String, sobrenome: String, password: String,context:NSManagedObjectContext){
        userOld.name = name
        userOld.sobrenome = sobrenome
        userOld.date = Date()
        userOld.email = email
        userOld.password = password
        
        save(context: context)
        
        
    }//editUser
        
    func deleteUser(offsets: IndexSet, context : NSManagedObjectContext, user : FetchedResults<User>){
        offsets.map{ user[$0] }
            .forEach(context.delete)
        save(context: context)
    }//delete food
    
    
    
}//class
