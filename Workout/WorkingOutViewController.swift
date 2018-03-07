//
//  workingOutViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/6/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class WorkingOutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /* Create a tableview
     
     YourStoryboard.storyboard > YouViewController > Attributes inspector > Uncheck - Adjust scroll view insets.
     -- removes gap at top of tableview
     
     drag tableview to VC add constraints
     +1 prototype cell
     Control Click on TableViewCell and set identifier to Cell
     create outlet  @IBOutlet weak var tableView: UITableView!
     
     Control Click drag to center = datasource + delegate OR
     tableview.delegate = self
     tableview.datasource = self
     
     REQUIRED DELEGATES = UITableViewDataSource, UITableViewDelegate
     */
    
    let titleArray = ["AAPL", "GOOG", "MSFT", "SPY"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        // for custom cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!StockTableViewCell
        cell.textLabel?.text = titleArray[indexPath.row]
        
        return cell
    }

}
