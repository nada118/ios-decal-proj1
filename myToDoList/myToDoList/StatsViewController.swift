//
//  StatsViewController.swift
//  myToDoList
//
//  Created by Nada Al-Alusi on 10/19/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var completedNum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.completedNum.text = "0"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
