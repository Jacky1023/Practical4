//
//  EditContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 28/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit

class EditContactViewController:UIViewController{
    
    var contactController:ContactController = ContactController()
    var contactList:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactList = contactController.retrieveAllContact()
    }
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
  
    
    @IBAction func SaveBtn(_ sender: Any) {
        let rowValue = appDelegate.rowValue
        let contact = contactList[rowValue!]
        if(txtFName.text != nil && txtLName != nil && txtMobileNo != nil){
            
            contactController.updateContact(mobileno: contact.mobileNo, newContact: Contact(firstname: txtFName.text!, lastname: txtLName.text!, mobileno: txtMobileNo.text!))
        }
        
        if(txtFName.text=="" && txtLName.text=="" && txtMobileNo.text=="")
               {
                   let alertView = UIAlertController(title: "failed", message: "failed to update contact", preferredStyle: UIAlertController.Style.alert)
                              self.present(alertView,animated: true, completion: nil)
                   //set timer to dismiss alertview
                   let when = DispatchTime.now() + 3
                   DispatchQueue.main.asyncAfter(deadline: when){
                       alertView.dismiss(animated: true, completion: nil);
                   }
               }
               else
               {
                   let alertView = UIAlertController(title: "Success", message: "update contact successfully", preferredStyle: UIAlertController.Style.alert)
                   self.present(alertView,animated: true, completion: nil)
                   
                   let when = DispatchTime.now() + 3
                              DispatchQueue.main.asyncAfter(deadline: when){
                                  alertView.dismiss(animated: true, completion: nil);
                              }
               }
    }
}
