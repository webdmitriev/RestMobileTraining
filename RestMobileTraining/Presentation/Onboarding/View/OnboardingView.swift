//
//  OnboardingView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 16.07.2025.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                highlightWord(
                    in: "IT IS NEVER \nTOO LATE \nTO START",
                    word: "START",
                    color: .appSuccess
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 52, weight: .bold))
                .foregroundStyle(.appWhite)
                
                Text("With this software, you can exercise your body at home or in the gym. We help you always stay healthy")
                    .modifier(RegularText(fontSize: 14, color: .appTextSecondary))
                    .padding(.bottom, 18)
                
                HStack(spacing: 12) {
                    Text("Get Started")
                        .primaryButtonStyle()
                    
                    Button {
                        print("go")
                    } label: {
                        Image("icon-arrow-black")
                            .resizable()
                            .padding(.leading, 3)
                            .scaledToFit()
                            .frame(width: 58, height: 58)
                            .background(.appSuccess)
                            .clipShape(RoundedRectangle(cornerRadius: 58 / 2))
                            .clipped()
                    }
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal, AppConstants.Layout.offset16)
            .background(.appTextPrimary)
            .overlay(alignment: .top) {
                BgGradient(height: 120, opacity: 0.9)
                    .offset(y: -118)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image("onboarding-02")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFill()
                .ignoresSafeArea(.all)
        }
    }
    
    private func highlightWord(in text: String, word: String, color: Color) -> Text {
        let parts = text.components(separatedBy: word)
        guard parts.count > 1 else { return Text(text) }
        
        var result = Text("")
        for (index, part) in parts.enumerated() {
            result = result + Text(part)
            if index != parts.count - 1 {
                result = result + Text(word).foregroundColor(color)
            }
        }
        
        return result
    }
}
