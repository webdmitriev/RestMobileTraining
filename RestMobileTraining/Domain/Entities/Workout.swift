//
//  Workout.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 09.07.2025.
//

import Foundation

struct Workout: Identifiable, Codable {
    let id: String
    let type: String
    let duration: Int
    let date: Date
    var notes: String?
    var imageName: String?
    
    init(id: String = UUID().uuidString, type: String, duration: Int, date: Date = Date(), notes: String? = nil, imageName: String? = nil) {
        self.id = id
        self.type = type
        self.duration = duration
        self.date = date
        self.notes = notes
        self.imageName = imageName
    }
    
    static func mockData() -> [Workout] {
        [
            Workout(
                id: "01",
                type: "Run",
                duration: 45,
                date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, // Вчера
                notes: "Интервальный бег 4x400м",
                imageName: "workout-01"
            ),
            Workout(
                id: "02",
                type: "Yoga",
                duration: 30,
                date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, // 3 дня назад
                notes: "Утренняя практика",
                imageName: "workout-02"
            ),
            Workout(
                id: "03",
                type: "Swimming",
                duration: 60,
                date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, // 5 дней назад
                notes: "Брасс 1.5 км",
                imageName: "workout-03"
            )
        ]
    }
    
}
