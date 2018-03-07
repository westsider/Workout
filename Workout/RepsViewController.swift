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
    @IBOutlet weak var workOutComplereBttn: UIButton!
    
    
    //var repsArray:[String] = []
    var repsIntArray:[Int] = []
    var exerciseTitle:String = ""
    var taskID = ""
    var task:Exercises?
    var tasksCompleted:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = Exercises().getExerciseBy(taskID: taskID, debug: true)
        populateTableview()
        // mark exercise done in database
        // change weight
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repsIntArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Set \(repsIntArray[indexPath.row] + 1)"
        if tasksCompleted.contains(indexPath.row) { cell.contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  exerciseTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkForSetsCompleted(row: indexPath.row, debug: true)
    }
    
    func checkForSetsCompleted(row:Int, debug:Bool) {
        print("tapped row \(row)")
        tasksCompleted.append(row)
        if debug { debugPrint(tasksCompleted) }
        let workoutComplete = tasksCompleted.contains(repsIntArray)
        if debug { print("it's \(workoutComplete) that the workout is complete") }
        tableview.reloadData()
        
        if workoutComplete {
            print("Sets complete")
            workOutComplereBttn.setTitle("Workout Complete",for: .normal)
            workOutComplereBttn.backgroundColor = #colorLiteral(red: 0.3615907431, green: 0.6538704038, blue: 0.172421515, alpha: 1)
            Exercises().newDateFor(taskID: taskID, debug: true)
        }
    }
    
    func populateTableview() {
        
        if let reps = task?.sets {
            for i in 0 ..< reps {
                repsIntArray.append(i)
            }
        }
        if let exercise = task?.type {  exerciseTitle = exercise }
        if let weightFound = task?.weight { weightLable.text = "\(weightFound) lbs" }
    }
}


