//
//  MasterTableViewController.swift
//  myToDoList
//
//  Created by Nada Al-Alusi on 10/19/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var toDoItems = [ToDoItem]()
    var completedItems = [ToDoItem]()
    
    override func viewDidAppear(_ animated: Bool) {
        let currTime = CFAbsoluteTimeGetCurrent()
        
        for (i, _) in completedItems.enumerated().reversed(){
            if (completedItems.count != 0 && completedItems[i] != nil && completedItems[i].time != nil){
                let diff = currTime - completedItems[i].time!
                if (diff > 86400){
                    completedItems.remove(at: i)
                }
            }
        }
        
        for (i, _) in toDoItems.enumerated().reversed(){
            if (toDoItems.count != 0 && toDoItems[i] != nil && toDoItems[i].time != nil){
                let diff = currTime - toDoItems[i].time!
                if (diff > 86400){
                    toDoItems.remove(at: i)
                }
            }
        }
        var stats: StatsViewController = StatsViewController()
        if (completedItems != nil && stats.completedNum != nil){
            stats.completedNum.text = String(completedItems.count)
        } else if (stats.completedNum != nil){
            stats.completedNum.text = "0"
        }
        
        self.tableView.reloadData()
    }
    
    
    func loadInitialData() {
        toDoItems = [
            ToDoItem(name: "Go to the dentist", details: "hep"),
            ToDoItem(name: "Fetch groceries", details: "help"),
            ToDoItem(name: "Sleep", details: "help")
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        let todoItem = toDoItems[indexPath.row]
        let cell = tempCell.textLabel as UILabel!
        cell!.text = todoItem.itemName as String
        
        if (todoItem.completed) {
            tempCell.accessoryType = UITableViewCellAccessoryType.checkmark;
        } else {
            tempCell.accessoryType = UITableViewCellAccessoryType.none;
        }
        
        return tempCell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            toDoItems.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let tappedItem = toDoItems[indexPath.row] as ToDoItem
        
        // TO DO change timer
        if (tappedItem.completed) {
            tappedItem.time = nil
            if (completedItems.contains(tappedItem)){
                for (i, _) in completedItems.enumerated().reversed(){
                    if (completedItems[i] == tappedItem){
                        completedItems.remove(at: i)
                    }
                }
            }
        } else {
            tappedItem.time = CFAbsoluteTimeGetCurrent()
            completedItems.append(tappedItem)
        }
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        
    }
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.source as! AddViewController
        
        let todoItem:ToDoItem = sourceViewController.todoItem
        
        if todoItem.itemName != "" {
            self.toDoItems.append(todoItem)
            self.tableView.reloadData()
        }
        // TO DO need to control drag done button to the exit item and select unwindandAddToList
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
