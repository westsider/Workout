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
    @objc dynamic var taskID     = NSUUID().uuidString
    
    func addInitialDate() {
        
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
}
