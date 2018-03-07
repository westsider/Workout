//
//  ViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/4/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lastWorkoutLable: UILabel!
    @IBOutlet weak var startWorkoutBttnText: UIButton!
    var lastWorkoutText:String = ""
    var startBttnTxt:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkoutData()
    }

    @IBAction func startWorkoutBttnAction(_ sender: Any) {
        segueToWorkoutVC()
    }
    
    @IBAction func offDatAction(_ sender: Any) {
    }
    
    func getWorkoutData() {
        lastWorkoutText = Exercises().getLastWorkout()
        lastWorkoutLable.text = lastWorkoutText
        startBttnTxt = Exercises().getNextWorkoutTxt()
        startWorkoutBttnText.setTitle(startBttnTxt,for: .normal)
    }
    
    private func segueToWorkoutVC() {
        let myVC:WorkingOutViewController = storyboard?.instantiateViewController(withIdentifier: "WorkoutsVC") as! WorkingOutViewController
        myVC.lastWorkoutText = lastWorkoutText
        myVC.startBttnTxt = startBttnTxt
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}
