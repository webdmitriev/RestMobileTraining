//
//  FetchWorkoutsRepositoryImpl.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation
import Combine

class FetchWorkoutsRepositoryImpl: FetchWorkoutsRepository {
    
    private let dataSource: FetchWorkoutsDataSource
    
    init(dataSource: FetchWorkoutsDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchWorkouts() -> AnyPublisher<[Workout], any Error> {
        self.dataSource.fetchWorkouts()
    }
    
    func mockFetchWorkouts() -> [Workout] {
        self.dataSource.mockWorkouts()
    }
    
}
