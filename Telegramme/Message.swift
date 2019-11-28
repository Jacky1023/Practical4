//
//  Message.swift
//  Telegramme
//
//  Created by MAD2_P02 on 26/11/19.
//  Copyright © 2019 Wong Kah Wo. All rights reserved.
//

import Foundation
class Message{
    
    var Date:Date
    var IsSender:Bool
    var Text:String
    
    init(date:Date, issender:Bool, text:String){
        Date = date
        IsSender = issender
        Text = text
    }
    
}
