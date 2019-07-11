//
//  Database.swift
//  
//
//  Created by Warren Hansen on 3/6/18.
//

import Foundation
import RealmSwift

class Exercises: Object {
    @objc dynamic var group = ""
    @objc dynamic var type  = ""
    @objc dynamic var sets       = 0
    @objc dynamic var reps       = 0
    @objc dynamic var weight     = 0
    @objc dynamic var date:Date?
    @objc dynamic var amTraining = false
    @objc dynamic var taskID     = NSUUID().uuidString
    @objc dynamic var videoFile = ""
    
    func addInitialDate() {
        
        let results = getExercises(debug: false)
        if results.last != nil {
            return
        }
        
        print("\nWe are adding initial data!\n")
        let realm = try! Realm()
        let allGroups = Data().groups()

        for each in allGroups {
            let anExercise = Exercises()
            anExercise.group = each.group
            anExercise.type = each.type
            anExercise.sets = each.sets
            anExercise.reps = each.reps
            anExercise.weight = each.weight
            anExercise.taskID = NSUUID().uuidString
            anExercise.videoFile = each.videoFile
            anExercise.date = Utilities().convertToDateFrom(string: "2017/01/10", debug: false)
            try! realm.write({
                realm.add(anExercise)
            })
        }
    }
    
    func clearAmTrainingFromGroup(group: String, debug:Bool) {
        let thisWorkout = sortWorkoutBy(group: group)
        let realm = try! Realm()
        try! realm.write({
            for each in thisWorkout {
                each.date = Date()
                each.amTraining = false
            }
        })
        if debug {  let _ = getExercises(debug: debug) }
    }
    
    func newDateFor(taskID: String, amTraining:Bool, debug:Bool) {
        let realm = try! Realm()
        let exercise = realm.objects(Exercises.self).filter("taskID == %@", taskID).last!
        try! realm.write({
            exercise.date = Date()
            if amTraining {
                exercise.amTraining = amTraining
            }
        })
        
        if debug {  let _ = getExercises(debug: debug) }
    }
    
     //MARK: = TODO - checck results in vdl
    func getExercises(debug:Bool)-> Results<Exercises> {
        let realm = try! Realm()
        let allExercises = realm.objects(Exercises.self)
        if ( debug ) {
            for each in allExercises {
                if let date = each.date {
                    print("\(date) \(each.group) \(each.type) o\(each.sets) h\(each.reps) l\(each.weight) c\(each.taskID)")
                } else  {
                    print("no date \(each.group) \(each.type) o\(each.sets) h\(each.reps) l\(each.weight) c\(each.taskID)")
                }
            }
        }
        return allExercises
    }
    
    func getExerciseBy(taskID:String, debug:Bool)-> Exercises {
        let realm = try! Realm()
        let exercise = realm.objects(Exercises.self).filter("taskID == %@", taskID).last!
        if ( debug ) {
            if let date = exercise.date {
                print("\(date) \(exercise.group) \(exercise.type) \(exercise.sets) \(exercise.reps) \(exercise.weight) \(exercise.taskID)")
            } else  {
                print("No Date \(exercise.group) \(exercise.type) \(exercise.sets) \(exercise.reps) \(exercise.weight) \(exercise.taskID)")
            }
        }
        return exercise
    }
    
    func changeWeightFor(taskID:String, to:Int) {
        let realm = try! Realm()
        let thisExercise = getExerciseBy(taskID: taskID, debug: true)
        try! realm.write({
            thisExercise.weight = to
        })
    }
    
    func sortWorkoutBy(group:String) -> Results<Exercises> {
        return Exercises().getExercises(debug: true).filter("group == %@", group)
    }
    
    func getNextWorkout(debug:Bool)-> Results<Exercises>  {
        var answer = sortWorkoutBy(group: "A")
        // get last tate from realm
        let results = Exercises().getExercises(debug: debug).sorted(byKeyPath: "date", ascending: true)
        
        // if last date nil set workout A to button,
        if results.last?.date == nil {
            return sortWorkoutBy(group: "A")
        }
        
        // else if amTraining filter group that is trining
        let amTraining: [Bool] = results.map { (amTraining: Exercises) in
            return amTraining.amTraining
        }
        if amTraining.contains(true) {
            let results = Exercises().getExercises(debug: debug).sorted(byKeyPath: "date", ascending: true).filter("amTraining == %@", true)
            if let thisGroup = results.last?.group {
                return sortWorkoutBy(group: thisGroup)
            }
        }
        
        // else if all dates match we are starting a new workout...
        guard let lastGroup = results.last?.group else {
            return sortWorkoutBy(group: "A")
        }
        
        switch lastGroup {
        case "A":
            answer = sortWorkoutBy(group: "B")
        case "B":
            answer = sortWorkoutBy(group: "C")
        case "C":
            answer = sortWorkoutBy(group: "A")
        default:
            answer = sortWorkoutBy(group: "A")
        }
        return answer
    }
    
    func getLastWorkout()-> String {
        var answer = "This is your first workout!"
        // get last tate from realm
        let results = Exercises().getExercises(debug: false).sorted(byKeyPath: "date", ascending: true)
        guard let lastDate = results.last?.date else {
            return answer
        }
        guard let lastGroup = results.last?.group else {
            return answer
        }
        answer = "Last Workout: \(lastGroup) \t\t\(Utilities().convertToLocal(date: lastDate)) \t\t\(addCommaTo(numbers: sumWeight())) lbs"
        
        // if last date was the initial valuse, say first workout
        if lastDate == Utilities().convertToDateFrom(string: "2017/01/10", debug: false) {
            answer = "This is your first workout!"
        }
        
        return answer
    }
    
    func sumWeight() -> Int {
        let results = Exercises().getExercises(debug: false)
        let weights:[Int] = results.map { (Exercises) -> Int in
            Exercises.weight
        }
        return weights.reduce(0, +)
    }
    
    func addCommaTo(numbers: Int)-> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0;
        formatter.locale = Locale.current
        guard let formattedSTring = formatter.string(from: NSNumber(value: numbers)) else { return "???"}
        return formattedSTring
    }
}












