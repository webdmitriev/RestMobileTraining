//
//  BgGradient.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 16.07.2025.
//

import SwiftUI

struct BgGradient: View {
    
    var height: CGFloat = 160
    var opacity: Double = 0.7
    
    var reverse: Bool = true
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .appTextPrimary.opacity(opacity)]),
                    startPoint: reverse ? .top : .bottom,
                    endPoint: reverse ? .bottom : .top
                )
            )
            .ignoresSafeArea()
            .frame(height: height)
    }
}
