//
//  FetchWorkoutsUseCase.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation
import Combine

protocol FetchWorkoutsUseCase {
    func execute() -> AnyPublisher<[Workout], Error>
    func mockExecute() -> [Workout]
}

class FetchWorkoutsUseCaseImpl: FetchWorkoutsUseCase {
    
    let repository: FetchWorkoutsRepository

    init(repository: FetchWorkoutsRepository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Workout], any Error> {
        self.repository.fetchWorkouts()
    }
    
    func mockExecute() -> [Workout] {
        self.repository.mockFetchWorkouts()
    }
    
}
