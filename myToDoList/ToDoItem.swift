//
//  ToDoItem.swift
//  myToDoList
//
//  Created by Nada Al-Alusi on 10/19/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: String = ""
    var itemDetails: String = ""
    var completed: Bool = false
    // DATE AND TIME
    var time:CFAbsoluteTime? = nil
    
    init(name:String, details:String){
        self.itemName = name
        self.itemDetails = details
    }

}
