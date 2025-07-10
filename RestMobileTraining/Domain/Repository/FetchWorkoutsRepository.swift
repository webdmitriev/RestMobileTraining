//
//  FetchWorkoutsRepository.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation
import Combine

protocol FetchWorkoutsRepository {
    func fetchWorkouts() -> AnyPublisher<[Workout], Error>
    func mockFetchWorkouts() -> [Workout]
}
