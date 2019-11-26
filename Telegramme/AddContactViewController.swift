//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 6/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class AddContactViewController:UIViewController{
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text=""
        lastNameFld.text=""
        mobileFld.text=""
    }
    @IBAction func createBtn(_ sender: Any) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.contactList.append(Contact(firstname: firstNameFld.text ?? "", lastname: lastNameFld.text ?? "", mobileno: mobileFld.text ?? "")
        
        let contactController = ContactController()
        contactController.AddContact(newContact:Contact( firstname: firstNameFld.text ?? "", lastname: lastNameFld.text ?? "", mobileno: mobileFld.text ?? ""))
        
//        let friendController = FriendController()
//               contactController.AddContact(newContact:Contact( firstname: firstNameFld.text ?? "", lastname: lastNameFld.text ?? "", mobileno: mobileFld.text ?? ""))
        if(firstNameFld.text=="" && lastNameFld.text=="" && mobileFld.text=="")
        {
            let alertView = UIAlertController(title: "failed", message: "failed to add new contact", preferredStyle: UIAlertController.Style.alert)
                       self.present(alertView,animated: true, completion: nil)
            //set timer to dismiss alertview
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when){
                alertView.dismiss(animated: true, completion: nil);
            }
        }
        else
        {
            let alertView = UIAlertController(title: "Success", message: "New contact was added", preferredStyle: UIAlertController.Style.alert)
            self.present(alertView,animated: true, completion: nil)
            
            let when = DispatchTime.now() + 3
                       DispatchQueue.main.asyncAfter(deadline: when){
                           alertView.dismiss(animated: true, completion: nil);
                       }
        }
        
     
    }
            
}
