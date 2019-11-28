//
//  ContactController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 18/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//Contact CRUD
class ContactController{
    
    //Add a new contact to Core Data
    func AddContact(newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName:"CDContact", in: context)!
        
        let CDContact = NSManagedObject(entity: entity, insertInto: context)
        CDContact.setValue(newContact.firstName,forKeyPath: "firstname")
        CDContact.setValue(newContact.lastName,forKeyPath: "lastname")
        CDContact.setValue(newContact.mobileNo,forKeyPath: "mobileno")
        
        do{
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Retrieve all contacts from core data
    func retrieveAllContact()->[Contact]
    {
       var contact:[NSManagedObject]=[]
       let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
       let context = appDelegate.persistentContainer.viewContext
       var contactList:[Contact]=[]

       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
       do{
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                let firstname = c.value(forKeyPath: "firstname") as? String
                let lastname = c.value(forKeyPath: "lastname") as? String
                let mobileno = c.value(forKeyPath: "mobileno") as? String
                contactList.append( Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!))
                //contactlist.append(c as! Contact)
            }
        } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
        }
        return contactList
    }
    
    //Update current contact with new contact
    //fetch data based on mobileno
    func updateContact(mobileno:String, newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@",mobileno)
        
        do {
            let result = try! managedContext.fetch(fetchRequest)
            let obj = result[0] as! NSManagedObject
            
            obj.setValue(newContact.firstName, forKeyPath:  "firstname")
            obj.setValue(newContact.lastName, forKeyPath: "lastname")
            obj.setValue(newContact.mobileNo, forKeyPath: "mobileno")

            do{
                try managedContext.save()
            } catch let error as NSError{
                print("Could not update: \(error), \(error.userInfo)")
            }
        }
    }
    
    //Delete Contact
    //fetch data based on mobileno
    func deleteContact(mobileno:String)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@",mobileno)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            let objdelete = result[0] as! NSManagedObject
            managedContext.delete(objdelete)
            
            do{
                try managedContext.save()
            }catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
            }
        }catch let error as NSError{
            print("Could not find using mobileno. \(error), \(error.userInfo)")
        }

    }
}

