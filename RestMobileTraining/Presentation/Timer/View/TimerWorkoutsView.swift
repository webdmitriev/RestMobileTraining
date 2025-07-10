//
//  TimerWorkoutsView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct TimerWorkoutsView: View {
    @StateObject private var timer = WorkoutTimer.shared
    @StateObject var viewModel: TimerWorkoutsViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Choose your workout")
                        .modifier(Titles(fontSize: .size24, alignment: .leading))
                        .padding(.top, 16)
                    
                    ForEach(viewModel.mockWorkouts()) { workout in
                        WorkoutCard(workout: workout, timer: timer)
                    }
                    
                    if timer.isActive {
                        Text("Time: \(timer.formattedCurrentTime())")
                            .modifier(SubTitles(color: .appTextPrimary, alignment: .center))
                            .padding(.top, 16)
                    }
                }
                .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                Spacer(minLength: 80)
            }
            .background(.appBackground)
        }
    }
}

struct WorkoutCard: View {
    let workout: Workout
    @ObservedObject var timer: WorkoutTimer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("workout-01")
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .cornerRadius(12)

            HStack {
                Text(workout.id)
                    .modifier(Titles(fontSize: .size24))

                Spacer()

                Button(action: toggleWorkout) {
                    Text(timer.isActive ? "Стоп" : "Старт")
                        .modifier(SubTitles(color: .appWhite, alignment: .center))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(timer.isActive ? .appDanger : .appSuccess)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.cornerRadius8))
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
    
    private func toggleWorkout() {
        if timer.isActive {
            timer.stop()
        } else {
            timer.start()
        }
    }
}
