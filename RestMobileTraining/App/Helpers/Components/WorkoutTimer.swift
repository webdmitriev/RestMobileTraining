//
//  WorkoutTimer.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import Foundation
import SwiftUI
import Combine

class WorkoutTimer: ObservableObject {
    @Published var isActive = false
    @Published var currentSessionDuration: TimeInterval = 0
    private var startTime: Date?
    private var totalDurationToday: TimeInterval = 0
    private var timerCancellable: AnyCancellable?
    
    func start() {
        guard !isActive else { return }
        
        // Загружаем сегодняшнюю тренировку
        let today = Calendar.current.startOfDay(for: Date())
        if let todayWorkout = WorkoutManager.shared.workouts.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
            totalDurationToday = todayWorkout.duration
        }
        
        isActive = true
        startTime = Date()
        
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTimer()
            }
    }
    
    func stop() {
        isActive = false
        timerCancellable?.cancel()
        saveWorkout()
    }
    
    private func updateTimer() {
        guard let startTime = startTime else { return }
        currentSessionDuration = Date().timeIntervalSince(startTime) / 60 // в минутах
    }
    
    private func saveWorkout() {
        let totalDuration = totalDurationToday + currentSessionDuration
        WorkoutManager.shared.updateTodayWorkout(duration: totalDuration)
        currentSessionDuration = 0
    }
    
    func formattedCurrentTime() -> String {
        let totalSeconds = Int(currentSessionDuration * 60)
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

