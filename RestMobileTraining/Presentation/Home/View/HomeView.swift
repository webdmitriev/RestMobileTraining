//
//  ContentView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var timer = WorkoutTimer()
    @StateObject private var workoutManager = WorkoutManager.shared

    var body: some View {
        NavigationStack {
            ScrollView {
                header
                    .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                Spacer(minLength: 24)
                
                // Текущая тренировка
                if timer.isActive {
                    Text(timer.formattedCurrentTime())
                        .font(.system(size: 48, weight: .bold, design: .monospaced))
                        .padding()
                }
                
                // График
                BarChartView(workouts: workoutManager.getLast7DaysWorkouts())
                    .frame(height: 250)
                    .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                // Кнопка старт/стоп
                Button(action: toggleWorkout) {
                    Text(timer.isActive ? "Стоп" : "Старт")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(timer.isActive ? Color.red : Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .background(Color.appBackground)
        }
    }
    
    private func toggleWorkout() {
        if timer.isActive {
            timer.stop()
        } else {
            timer.start()
        }
    }
    
    var header: some View {
        HStack(spacing: 16) {
            Text("Hello, Oleg!")
                .modifier(Titles(fontSize: .size28))
                .lineLimit(1)
                .frame(maxWidth: AppConstants.Layout.screenWidth - 80)
            
            Spacer()
            
            Image("avatar-default")
                .resizable()
                .frame(width: 48, height: 48)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .clipped()
        }
        .frame(maxWidth: .infinity)
    }

}

