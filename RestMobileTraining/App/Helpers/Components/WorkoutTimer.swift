//
//  WorkoutTimer.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import Foundation
import SwiftUI
import Combine

final class WorkoutTimer: ObservableObject {
    static let shared = WorkoutTimer()

    @Published var isActive = false
    @Published var currentSessionDuration: TimeInterval = 0
    @Published var selectedWorkout: WorkoutType? = nil

    private var startTime: Date?
    private var timerCancellable: AnyCancellable?
    
    private init() {}
    
    func start() {
        guard !isActive else { return }
        
        isActive = true
        startTime = Date()
        currentSessionDuration = 0
        
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
        selectedWorkout = nil
        currentSessionDuration = 0
    }
    
    private func updateTimer() {
        guard let startTime = startTime else { return }
        currentSessionDuration = Date().timeIntervalSince(startTime) / 60
    }
    
    private func saveWorkout() {
        WorkoutManager.shared.addToToday(duration: currentSessionDuration)
    }
    
    func formattedCurrentTime() -> String {
        let totalSeconds = Int(currentSessionDuration * 60)
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

