//
//  BarChartView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct BarChartView: View {
    let workouts: [WorkoutData]
    private let maxHeight: CGFloat = 8
    
    private var maxDuration: CGFloat {
        max(workouts.map { CGFloat($0.duration) }.max() ?? 1, 1)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { geometry in
                let availableWidth = geometry.size.width - 72
                let columnWidth = max(availableWidth / CGFloat(workouts.count), 10)
                
                HStack(alignment: .bottom, spacing: 12) {
                    ForEach(workouts) { workout in
                        let columnHeight = (CGFloat(workout.duration) / maxDuration) * maxHeight * 10
                        
                        VStack(spacing: 4) {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(
                                    width: columnWidth,
                                    height: max(columnHeight, 0)
                                )
                                .cornerRadius(4)
                            
                            Text(formatDate(workout.date))
                                .font(.caption2)
                                .foregroundColor(.gray)
                            
                            Text(formatDuration(workout.duration))
                                .font(.caption2)
                                .foregroundColor(.blue)
                        }
                        .frame(width: columnWidth)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: maxHeight * 10 + 50)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
    
    private func formatDuration(_ minutes: TimeInterval) -> String {
        let totalMinutes = Int(minutes)
        let hours = totalMinutes / 60
        let mins = totalMinutes % 60
        return hours > 0 ? "\(hours)ч \(mins)м" : "\(mins)м"
    }
}
