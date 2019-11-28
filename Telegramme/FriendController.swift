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

    //func AddMessageTofriend(friend:Contact, message:Message)
    func AddMessageTofriend(friend:Friend, message:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Get message table
        let Messageentity = NSEntityDescription.entity(forEntityName:"CDMessage", in: context)!
        //create new row with iuts value in message entity
        let CDMessage = NSManagedObject(entity: Messageentity, insertInto: context)
        CDMessage.setValue(message.Date,forKeyPath: "date")
        CDMessage.setValue(message.IsSender,forKeyPath: "isSender")
        CDMessage.setValue(message.Text,forKeyPath: "text")
        
        //Fetch friend table to fetch a row
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        //fetch a row in friend table where name is queal to friend.Name
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.Name)

        do{
            //fetch the list of results in the query
            let test = try context.fetch(fetchRequest)
            //get the first reuslt of the list
            let CDFriend = test[0]
            //create a new friend object in relation to the message entity
            CDMessage.setValue(CDFriend, forKey: "friend")
            try context.save()
        }
        catch{
            print(error)
        }
    }

    func retrieveMessagebyfriend(friend:Friend)->[Message]
    {
        var messageList:[Message] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //get Message table
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        // get message table based on friend
        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.Name)
        do{
            //get rows in message table
            let message = try context.fetch(fetchRequest)
            for m in message{                      //as! = force downcasting
                let d = m.value(forKey: "date") as? Date
                let i = m.value(forKey: "isSender") as? Bool
                let t = m.value(forKey: "text") as? String
                messageList.append(Message(date:d!, issender: i!, text: t!))
            }
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return messageList

    }

}
