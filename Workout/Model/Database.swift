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
    @objc dynamic var taskID     = NSUUID().uuidString
    
    func addInitialDate() {
        
        //MARK: = TODO - if realm empty, add basic exercises - app delagate
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
            try! realm.write({
                realm.add(anExercise)
            })
        }
    }
    
     //MARK: = TODO - checck results in vdl
    func getExercises(debug:Bool)-> Results<Exercises> {
        let realm = try! Realm()
        let allExercises = realm.objects(Exercises.self)
        if ( debug ) {
            for each in allExercises {
                print("\(each.group) \(each.type) o\(each.sets) h\(each.reps) l\(each.weight) c\(each.taskID)")
            }
        }
        return allExercises
    }
    
    func getNextWorkoutTxt()-> String {
        var answer = "Start Workout"
        // get last tate from realm
        let results = Exercises().getExercises(debug: true).sorted(byKeyPath: "date", ascending: true)
        
        // if last date nil set workout A to button,
        if results.last?.date == nil {
            return "Start Workout A"
        }
        // else last date
        guard let lastGroup = results.last?.group else {
            return answer
        }
        
        switch lastGroup {
        case "A":
            answer += " B"
        case "B":
            answer += " C"
        case "C":
            answer += " A"
        default:
            answer += " A"
        }
        
        return answer
    }
    
    func sortWorkoutBy(group:String) -> Results<Exercises> {
        return Exercises().getExercises(debug: true).filter("group == %@", group)
    }
    
    func getNextWorkout()-> Results<Exercises>  {
        var answer = sortWorkoutBy(group: "A")
        // get last tate from realm
        let results = Exercises().getExercises(debug: true).sorted(byKeyPath: "date", ascending: true)
        
        // if last date nil set workout A to button,
        if results.last?.date == nil {
            return sortWorkoutBy(group: "A")
        }
        // else last date
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
        let results = Exercises().getExercises(debug: true).sorted(byKeyPath: "date", ascending: true)
        
        // if last date nil set workout A to button,
        guard let lastDate = results.last?.date else {
            return answer
        }
        guard let lastGroup = results.last?.group else {
            return answer
        }
        answer = "Last Workout Was \(lastGroup) on \(lastDate)"
        return answer
    }
}












