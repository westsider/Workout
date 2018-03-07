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
    var lastWorkoutText:String = ""
    var startBttnTxt:String = ""
    
    var titleArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let results = Exercises().getNextWorkout()
        
        if let char = results.last?.group {
            title = "Workout \(char)"
        }
        
        let typeArray: [String] = results.map { (type: Exercises) in
            return type.type
        }
        
        for each in typeArray {
            titleArray.append(each)
        }
        
        // todo sets reps weigh in 2nd row
        // todo clicking on row changes color and sets a counter
        // if we segue out with counter at 5, give the goup a date
    }
    
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
