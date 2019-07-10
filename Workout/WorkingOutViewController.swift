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
    var exercisesCompleted:[Int] = []
    let attributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: UIFont(name: "PingFangHK-Regular", size: 17)!,
         NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.449757278, green: 0.7243286371, blue: 0.2090303898, alpha: 1),
         NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
    
    let standardAtt: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: UIFont(name: "PingFangHK-Regular", size: 17)!,
         NSAttributedString.Key.foregroundColor : UIColor.black,
         NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let group = tasks.last?.group {
            title = "Workout \(group)"
        }
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
        checkIfAllExercisesComplete(debug: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = tasks[indexPath.row].type
        cell.detailTextLabel?.text = setDetailForTableview(row: indexPath.row)
        cell.imageView?.image = #imageLiteral(resourceName: "iconGrey")
        let answer = Utilities().lastUpdateWasToday(dateToCheck: tasks[indexPath.row].date! , debug: true)
        if answer {
            cell.textLabel?.attributedText =  NSAttributedString(string: setDetailForTableview(row: indexPath.row), attributes: attributes )
            cell.detailTextLabel?.attributedText =  NSAttributedString(string: tasks[indexPath.row].type, attributes: attributes )
            cell.imageView?.image = #imageLiteral(resourceName: "icon")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateTasksCompleted(row: indexPath.row, debug: false)
        segueToRepsVC(row: indexPath.row)
    }
    
    func setDetailForTableview(row:Int) -> String {
        return"\(tasks[row].sets) Sets \t \(tasks[row].reps) reps\t \(tasks[row].weight) lbs"
    }
    
    func updateTasksCompleted(row:Int, debug:Bool) {
        exercisesCompleted.append(row)
    }
    
    func checkIfAllExercisesComplete(debug:Bool) {
        let allWorkouts = [0, 1, 2, 3, 4]
        let workoutComplete = exercisesCompleted.contains(allWorkouts)
        if debug { print("it's \(workoutComplete) that the workout is complete") }
        tableview.reloadData()
        
        if workoutComplete {
            segueMainVC()
        }
    }
    
    private func segueMainVC() {
        let myVC:MainViewController = storyboard?.instantiateViewController(withIdentifier: "workoutVC") as! MainViewController
       
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    private func segueToRepsVC(row:Int) {
        let myVC:RepsViewController = storyboard?.instantiateViewController(withIdentifier: "RepsVC") as! RepsViewController
       myVC.taskID = tasks[row].taskID
        myVC.exercisesCompleted = exercisesCompleted
        navigationController?.pushViewController(myVC, animated: true)
    }
}

public extension Sequence where Element : Hashable {
    func contains(_ elements: [Element]) -> Bool {
        return Set(elements).isSubset(of:Set(self))
    }
}
