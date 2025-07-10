//
//  TimerWorkoutsViewModel.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation

struct WorkoutType: Identifiable, Equatable {
    let id: String
    let name: String
    let imageName: String
}

final class TimerWorkoutsViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    @Published var selectedWorkout: WorkoutType? = nil
    
    let getMockDataUseCase: FetchWorkoutsUseCase
    
    init(getMockDataUseCase: FetchWorkoutsUseCase) {
        self.getMockDataUseCase = getMockDataUseCase
    }
    
    func mockWorkouts() -> [Workout] {
        self.getMockDataUseCase.mockExecute()
    }
    
    func isSelected(_ workout: WorkoutType) -> Bool {
        return selectedWorkout == workout
    }
    
    func toggle(workout: WorkoutType, timer: WorkoutTimer) {
        if timer.isActive && selectedWorkout == workout {
            timer.stop()
            selectedWorkout = nil
        } else {
            timer.stop()
            selectedWorkout = workout
            timer.start()
        }
    }
}
