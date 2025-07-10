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
}
