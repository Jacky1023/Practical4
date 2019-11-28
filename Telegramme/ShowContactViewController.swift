//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 6/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ShowContactViewController : UITableViewController{
    var contactList:[Contact]=[]
    var contactController:ContactController = ContactController()

    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        


    }
    
    override func viewDidAppear(_ animated: Bool){
        let contactController = ContactController()
        contactList = contactController.retrieveAllContact()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return contactList.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"

        
        return cell
    }
    
    /*Exercise 2*/
    //delete the row selected
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(contactList.count)
        print(indexPath.row)
        if editingStyle == UITableViewCell.EditingStyle.delete{
           contactList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.middle)

       }

   }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appDelegate.rowValue = indexPath.row
    }


    
    
}


