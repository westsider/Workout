//
//  RepsViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/7/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit
import RealmSwift

class RepsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var weightLable: UILabel!
    
    var repsArray:[String] = []
    var exerciseTitle:String = ""
    var taskID = ""
    var task:Exercises?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = Exercises().getExerciseBy(taskID: taskID, debug: true)
        populateTableview()
        // mark sets done
        // load weight
        // change weight
    }
    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repsArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = repsArray[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  exerciseTitle
    }
    
    func populateTableview() {
        
        if let reps = task?.sets {
            for i in 1 ... reps {
                repsArray.append("Set \(i)")
            }
        }
        if let exercise = task?.type {  exerciseTitle = exercise }
        if let weightFound = task?.weight { weightLable.text = "\(weightFound) lbs" }
    }
}
