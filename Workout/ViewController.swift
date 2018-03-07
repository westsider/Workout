//
//  ViewController.swift
//  Workout
//
//  Created by Warren Hansen on 3/4/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lastWorkoutLable: UILabel!
    
    @IBOutlet weak var startWorkoutBttnText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let results = Exercises().getExercises(debug: true)
    }

    @IBAction func startWorkoutBttnAction(_ sender: Any) {
    }
    
    @IBAction func offDatAction(_ sender: Any) {
    }
    
    
    
}

