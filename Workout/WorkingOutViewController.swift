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
    var tasks = Exercises().getNextWorkout(debug: false)
    var tasksCompleted:[Int] = []
    
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
        cell.textLabel?.text = tasks[indexPath.row].type
        cell.detailTextLabel?.text = setDetailForTableview(row: indexPath.row)
        if tasksCompleted.contains(indexPath.row) { cell.contentView.backgroundColor = #colorLiteral(red: 0.6610911489, green: 0.8887128234, blue: 0.296472311, alpha: 1) }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkForWorkoutCompleted(row: indexPath.row, debug: false)
    }
    
    func setDetailForTableview(row:Int) -> String {
        return"\(tasks[row].sets) Sets \t \(tasks[row].reps) reps\t \(tasks[row].weight) lbs"
    }
    
    func checkForWorkoutCompleted(row:Int, debug:Bool) {
        tasksCompleted.append(row)
        if debug { debugPrint(tasksCompleted) }
        let allWorkouts = [0, 1, 2, 3, 4]
        let workoutComplete = tasksCompleted.contains(allWorkouts)
        if debug { print("it's \(workoutComplete) that the workout is complete") }
        tableview.reloadData()
        
        if workoutComplete {
            // save date
            Exercises().newDateFor(group: tasks.last!.group, debug: false)
            // dismiss vc 
        }
    }
}

public extension Sequence where Element : Hashable {
    func contains(_ elements: [Element]) -> Bool {
        return Set(elements).isSubset(of:Set(self))
    }
}
