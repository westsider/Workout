//
//  ViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/4/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

// [ ] icon of exercise https://makeapppie.com/2015/12/04/how-to-use-custom-table-cells-in-a-uitableview/


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lastWorkoutLable: UILabel!
    @IBOutlet weak var startWorkoutBttnText: UIButton!
    var lastWorkoutText:String = ""
    var startBttnTxt:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout Tracker"
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        if let thisGroup = Exercises().getNextWorkout(debug: false).last?.group {
            startBttnTxt = "Start Workout \(thisGroup)"
        }
        startWorkoutBttnText.setTitle(startBttnTxt,for: .normal)
    }
    
    private func segueToWorkoutVC() {
        let myVC:WorkingOutViewController = storyboard?.instantiateViewController(withIdentifier: "WorkoutsVC") as! WorkingOutViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}

