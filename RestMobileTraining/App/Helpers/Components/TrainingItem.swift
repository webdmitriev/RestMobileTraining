//
//  TrainingItem.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 09.07.2025.
//

import SwiftUI

struct TrainingItem: View {
    let item: Workout

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(item.imageName ?? "workout-01")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.cornerRadius8))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Course workout in house")
                    .modifier(SecondaryText(alignment: .leading))
                
                Text("Leg strengthening exercises")
                    .modifier(SubTitles(fontSize: .size18, alignment: .leading))
                    .padding(.bottom, 8)
                    .lineLimit(1)
                
                ProgressView(value: 0.7, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(
                        tint: .appSecondary
                    ))
                    .frame(height: 8)
                    .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.cornerRadius8))

            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(AppConstants.Layout.offset8)
        .background(
            RoundedRectangle(cornerRadius: AppConstants.Layout.cornerRadius8)
                .fill(.appWhite)
                .shadow(color: .appTextPrimary.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}
