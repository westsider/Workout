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
    var videoFile:String
}

class Data {

    func groups() -> [Exercise]  {
        
        var group:[Exercise] = []
        // Group A
        group.append(Exercise(group: "A", type: "BB Squat", sets: 4, reps: 8, weight: 135, videoFile: "Videos/workoutA/BarbellBackSquat"))
        group.append(Exercise(group: "A", type: "Incline DB Press", sets: 4, reps: 8, weight: 45, videoFile: "Videos/workoutA/DumbbellInclineBenchPress"))
        group.append(Exercise(group: "A", type: "DB Seal Row", sets: 4, reps: 8, weight: 40, videoFile: "Videos/workoutA/DumbbellSealRow"))
        group.append(Exercise(group: "A", type: "One Arm Delta Flys", sets: 3, reps: 8, weight: 20, videoFile: "Videos/workoutA/1_ArmDeltFly"))
        group.append(Exercise(group: "A", type: "BB Curls", sets: 3, reps: 12, weight: 55, videoFile: "Videos/workoutA/BarbellBicepCurl"))
        group.append(Exercise(group: "C", type: "Hanging Leg Raise ", sets: 3, reps: 8, weight: 0, videoFile: "Videos/workoutC/HangingLegRaise"))
        group.append(Exercise(group: "A", type: "Jake G", sets: 3, reps: 12, weight: 10, videoFile: "Videos/workoutA/BarbellBicepCurl"))
        
        // Group B
        group.append(Exercise(group: "B", type: "Bulgarian Split Squat", sets: 4, reps: 8, weight: 20, videoFile: "Videos/workoutB/BulgarianSplitSquat"))
        group.append(Exercise(group: "B", type: "Military Press", sets: 4, reps: 8, weight: 80, videoFile: "Videos/workoutB/BarbellMilitaryPress"))
        group.append(Exercise(group: "B", type: "Lat Pulldown", sets: 4, reps: 8, weight: 80, videoFile: "Videos/workoutB/LatPulldown"))
        group.append(Exercise(group: "B", type: "Rear Delt Fly", sets: 3, reps: 12, weight: 30, videoFile: "Videos/workoutB/DumbbellRearDeltFly"))
        group.append(Exercise(group: "B", type: "Decline Sit-Up", sets: 3, reps: 12, weight: 205, videoFile: "Videos/workoutB/DeclineSitUp"))
        group.append(Exercise(group: "C", type: "Hanging Leg Raise ", sets: 3, reps: 8, weight: 0, videoFile: "Videos/workoutC/HangingLegRaise"))
        
        // Group B
        group.append(Exercise(group: "C", type: "Leg Press ", sets: 4, reps: 8, weight: 180, videoFile: "Videos/workoutC/LegPress"))
        group.append(Exercise(group: "C", type: "Incline Chest Machine", sets: 4, reps: 8, weight: 135, videoFile: "Videos/workoutC/InclineChestPressMachine"))
        group.append(Exercise(group: "C", type: "Back Row Machine", sets: 4, reps: 8, weight: 140, videoFile: "Videos/workoutC/BackRowMachine"))
        group.append(Exercise(group: "C", type: "Shoulder Press Machine", sets: 4, reps: 12, weight: 110, videoFile: "Videos/workoutC/ShoulderPressMachine"))
        group.append(Exercise(group: "B", type: "Decline Sit-Up", sets: 3, reps: 12, weight: 205, videoFile: "Videos/workoutB/DeclineSitUp"))
        group.append(Exercise(group: "C", type: "Hanging Leg Raise ", sets: 3, reps: 8, weight: 0, videoFile: "Videos/workoutC/HangingLegRaise"))
        
      return group
    }
    
}

/*
    Warm ups
 Band Pull aparts * 20
 Glute Bridges * 20
 Hip Flexor Stretch * 3 each side
 Yoga Push Up * 10
 Fire Hydrant 10 each side
 
 https://vimeo.com/237828102/854ab8806d
 */
