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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.contactList.append(Contact(firstname: firstNameFld.text ?? "", lastname: lastNameFld.text ?? "", mobileno: mobileFld.text ?? "")
//        let context = appDelegate.contactList
//        var record = NSEntityDescription.insertNewObject(forEntityName: CDContact, into: context) as NSManagedObject
//        record.setValue("1",forKey:"data")
//        do {
//            try context.save()
//        } catch {
//            print("error")
//        }
//        print(record)
//        print(String(appDelegate.contactList.count))
     
    )}
            
}
