//
//  Data.swift
//  Workout
//
//  Created by Warren Hansen on 3/4/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

struct Exercise {
    var group:String
    var type:String
    var sets: Int
    var reps:Int
    var weight:Int
}

class Data {

    func groups() -> [Exercise]  {
        
        var group:[Exercise] = []
        // Group A
        group.append(Exercise(group: "A", type: "BB Squat", sets: 4, reps: 8, weight: 135))
        group.append(Exercise(group: "A", type: "Ind DB Pressget", sets: 4, reps: 8, weight: 50))
        group.append(Exercise(group: "A", type: "DB Seal Roe", sets: 4, reps: 8, weight: 40))
        group.append(Exercise(group: "A", type: "1 Arm Delt Flys", sets: 3, reps: 8, weight: 20))
        group.append(Exercise(group: "A", type: "BB Curls", sets: 3, reps: 12, weight: 55))
        
        // Group B
        group.append(Exercise(group: "B", type: "Bulgarian Split Squat", sets: 4, reps: 8, weight: 20))
        group.append(Exercise(group: "B", type: "Military Press", sets: 4, reps: 8, weight: 80))
        group.append(Exercise(group: "B", type: "Lat Pulldown", sets: 4, reps: 8, weight: 80))
        group.append(Exercise(group: "B", type: "Rear Delt Fly", sets: 3, reps: 12, weight: 25))
        group.append(Exercise(group: "B", type: "Decline Sit-Up", sets: 3, reps: 12, weight: 205))
        
        // Group B
        group.append(Exercise(group: "C", type: "Leg Press ", sets: 4, reps: 8, weight: 180))
        group.append(Exercise(group: "C", type: "Incline Chest Machine", sets: 4, reps: 8, weight: 160))
        group.append(Exercise(group: "C", type: "Back Row Machine", sets: 4, reps: 8, weight: 140))
        group.append(Exercise(group: "C", type: "Shoulder Press Machine", sets: 4, reps: 12, weight: 160))
        group.append(Exercise(group: "C", type: "Hanging Leg Raise ", sets: 3, reps: 8, weight: 0))
        
      return group
    }
    
}
