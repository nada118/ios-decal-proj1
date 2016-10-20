//
//  AddViewController.swift
//  myToDoList
//
//  Created by Nada Al-Alusi on 10/19/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField()
    
    @IBOutlet weak var detailsTextView: UITextView! = UITextView()
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var toDoItems = [ToDoItem]()
    var todoItem: ToDoItem = ToDoItem(name: "", details: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func addButtonTapped(_ sender: AnyObject) {
//        print("tapped!")
//        var item:ToDoItem = ToDoItem(name: titleTextField.text!, details: detailsTextView.text)
//        
//        
//        let defaults = UserDefaults.standard
//        var itemList:NSMutableArray? = defaults.object(forKey: "itemList") as? NSMutableArray
//        //
//        //
//        //        let dataSet:NSMutableDictionary = NSMutableDictionary()
//        //        dataSet.setObject(titleTextField.text, forKey: "itemTitle" as NSCopying)
//        //        dataSet.setObject(detailsTextView.text, forKey: "itemDetails" as NSCopying)
//        //
//        //        if (itemList != nil){
//        //            //data already available
//        //            let newMutableList:NSMutableArray = NSMutableArray()
//        //            for dict:AnyObject in itemList! as [AnyObject]{
//        //                newMutableList.add(dict as! NSDictionary)
//        //            }
//        //            defaults.removeObject(forKey: "itemList")
//        //            newMutableList.add(dataSet)
//        //            defaults.set(newMutableList, forKey: "itemList")
//        //
//        //        } else{
//        //            //this is the first todo item in the list
//        //            defaults.removeObject(forKey: "itemList")
//        //            itemList = NSMutableArray()
//        //            itemList!.add(dataSet)
//        //            defaults.set(itemList, forKey: "itemList")
//        //        
//        //        }
//        defaults.synchronize()
//        self.navigationController?.popToRootViewController(animated: true)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // Question
        if ((self.titleTextField.text!.characters.count) > 0) {
            self.todoItem = ToDoItem(name: self.titleTextField.text!, details: self.detailsTextView.text)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
