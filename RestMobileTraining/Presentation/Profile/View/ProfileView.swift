//
//  ProfileView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    // MARK: - Сброс данных
    @State private var showResetAlert = false
    
    var body: some View {
        VStack {
            // Ваш существующий контент профиля...
            
            Spacer()
            
            Button(action: resetWorkoutData) {
                Text("Сбросить данные тренировок")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showResetAlert) {
                Alert(
                    title: Text("Подтверждение"),
                    message: Text("Вы уверены, что хотите сбросить все данные тренировок?"),
                    primaryButton: .destructive(Text("Сбросить"), action: confirmReset),
                    secondaryButton: .cancel()
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Профиль")
    }
    
    private func resetWorkoutData() {
        showResetAlert = true
    }
    
    private func confirmReset() {
        workoutManager.workouts = []
        workoutManager.saveWorkouts()
    }
}
