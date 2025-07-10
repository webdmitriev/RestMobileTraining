//
//  HomeViewModel.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    let getMockDataUseCase: FetchWorkoutsUseCase
    
    init(getMockDataUseCase: FetchWorkoutsUseCase) {
        self.getMockDataUseCase = getMockDataUseCase
    }
    
    func mockWorkouts() -> [Workout] {
        getMockDataUseCase.mockExecute()
    }

}
