//
//  RemoteWorkoutsDataSourceImpl.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 10.07.2025.
//

import Foundation
import Combine

class RemoteWorkoutsDataSourceImpl: FetchWorkoutsDataSource {

    func fetchWorkouts() -> AnyPublisher<[Workout], any Error> {
        let urlString = "www"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Workout].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return dataPublisher
    }
    
    func mockWorkouts() -> [Workout] {
        [
            Workout(
                id: "01",
                type: "Run",
                duration: 45,
                date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                notes: "Интервальный бег 4x400м",
                imageName: "workout-01"
            ),
            Workout(
                id: "02",
                type: "Yoga",
                duration: 30,
                date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                notes: "Утренняя практика",
                imageName: "workout-02"
            ),
            Workout(
                id: "03",
                type: "Swimming",
                duration: 60,
                date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
                notes: "Брасс 1.5 км",
                imageName: "workout-03"
            )
        ]
    }
    
}
