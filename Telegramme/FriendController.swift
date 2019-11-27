//
//  FriendController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 25/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FriendController {
    func AddFriend(friend:Friend)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
               
        let entity = NSEntityDescription.entity(forEntityName:"CDFriend", in: context)!
               
        let CDFriend = NSManagedObject(entity: entity, insertInto: context)
        CDFriend.setValue(friend.Name,forKeyPath: "name")
        CDFriend.setValue(friend.profileImageName,forKeyPath: "profileImageName")
               
        do{
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

//    //func AddMessageTofriend(friend:Friend, message:Message)
//    func AddMessageTofriend(friend:Contact, message:Message)
//    {
//        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//               
//        let entity = NSEntityDescription.entity(forEntityName:"CDMessage", in: context)!
//               
//        let CDMessage = NSManagedObject(entity: entity, insertInto: context)
//        CDMessage.setValue(message.Date,forKeyPath: "date")
//        CDMessage.setValue(message.isSender,forKeyPath: "isSender")
//        CDMessage.setValue(message.Text,forKeyPath: "text")
//        
//
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
//        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.lastName)
//
//        do{
//            let test = try context.fetch(fetchRequest)
//            print("Added for")
//            let CDFriend = test[0]
//            //Relationship
//            CDMessage.setValue(CDFriend, forKey: "")
//            try context.save()
//        }
//        catch{
//            print(error)
//        }
//    }

//    func retrieveMessagebyfriend(friend:Friend)->[Message]
//    {
//        var messageList:[Message] = []
//
//        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
//
//        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.Name)
//        do{
//            let list:[NSManagedObject] = try context.fetch(fetchRequest)
//            for l in list{                      //as! = force downcasting
//                let d = l.value(forKey: "date") as! Date
//                let i = l.value(forKey: "isSender") as! Bool
//                let t = l.value(forKey: "text") as! String
//                //print("\(d) \(i) \(t)")
//                messageList.append(Message(date: <#T##Date#>, issender: <#T##Bool#>, text: <#T##String#>))
//            }
//        }
//        catch
//        {
//            print(error)
//        }
//        return messageList
//
//    }

}
