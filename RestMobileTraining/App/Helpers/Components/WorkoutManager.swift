//
//  WorkoutManager.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import Foundation
import Combine

struct WorkoutData: Codable, Equatable, Identifiable {
    var id: Date { date }
    let date: Date
    var duration: TimeInterval
}

class WorkoutManager: ObservableObject {
    static let shared = WorkoutManager()
    private let key = "workoutData"
    
    @Published var workouts: [WorkoutData] = []
    
    init() {
        loadWorkouts()
    }
    
    private func loadWorkouts() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([WorkoutData].self, from: data) {
            workouts = decoded
        }
    }
    
    func saveWorkouts() {
        if let encoded = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func updateTodayWorkout(duration: TimeInterval) {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let index = workouts.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
            workouts[index].duration = duration
        } else {
            workouts.append(WorkoutData(date: today, duration: duration))
        }
        
        saveWorkouts()
    }
    
    func getLast7DaysWorkouts() -> [WorkoutData] {
        let today = Calendar.current.startOfDay(for: Date())
        var last7Days: [WorkoutData] = []
        
        for dayOffset in 0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: -dayOffset, to: today)!
            let workout = workouts.first { Calendar.current.isDate($0.date, inSameDayAs: date) } ??
                          WorkoutData(date: date, duration: 0)
            last7Days.append(workout)
        }
        
        return last7Days.reversed()
    }
    
    func resetAllData() {
        workouts = []
        saveWorkouts()
    }
}
