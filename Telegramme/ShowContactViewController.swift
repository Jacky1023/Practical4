//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 6/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit

class ShowContactViewController : UITableViewController{
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        //cell.detailTextLabel!.text = "\(contact.mobileNo)"
        
        return cell
    }
    
    /*Exercise 2*/
    //delete the row selected
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var contactList:[Contact]=[]
        print(contactList.count)

        print(indexPath.row)
       if editingStyle == .delete{
           contactList.remove(at: indexPath.row)
           tableView.beginUpdates()
           tableView.deleteRows(at: [indexPath], with: .automatic)
           tableView.endUpdates()
       }

   }

    
    
}


