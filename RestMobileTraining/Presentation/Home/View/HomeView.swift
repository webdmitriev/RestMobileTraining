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
                
                Spacer(minLength: 48)
                
                // Текущая тренировка
                Text(timer.isActive ? timer.formattedCurrentTime() : "00:00")
                    .modifier(Titles(fontSize: .size32,
                                     color: timer.isActive ? .appTextPrimary : .appTextSecondary,
                                     alignment: .center))
                    .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                // График
                BarChartView(workouts: workoutManager.getLast7DaysWorkouts())
                    .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                // Кнопка старт/стоп
                Button(action: toggleWorkout) {
                    Text(timer.isActive ? "Стоп" : "Старт")
                        .modifier(SubTitles(color: .appWhite, alignment: .center))
                        .padding(.vertical, 11)
                        .background(timer.isActive ? .appDanger : .appSuccess)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.cornerRadius8))
                }
                .padding(.top, 20)
                .padding(.horizontal, AppConstants.Layout.offsetPage)
                
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

