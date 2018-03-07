//
//  workingOutViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/6/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit
import RealmSwift

class WorkingOutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var lastWorkoutText:String = ""
    var startBttnTxt:String = ""
    var tasks = Exercises().getNextWorkout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let group = tasks.last?.group {
            title = "Workout \(group)"
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        // for custom cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!StockTableViewCell
        cell.textLabel?.text = tasks[indexPath.row].type
        cell.detailTextLabel?.text = setDetailForTableview(row: indexPath.row)
        return cell
    }

    func setDetailForTableview(row:Int) -> String {
        return"\(tasks[row].sets) Sets \t \(tasks[row].reps) reps\t \(tasks[row].weight) lbs"
       
    }
    

}
