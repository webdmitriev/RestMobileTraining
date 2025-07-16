//
//  ButtonModifier.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 16.07.2025.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    let fontSize: CGFloat
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .modifier(RegularText(fontSize: fontSize, color: textColor, alignment: .center))
            .fontWeight(.bold)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity, minHeight: 58)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func primaryButtonStyle(
        fontSize: CGFloat = 20,
        textColor: Color = .appTextPrimary,
        backgroundColor: Color = .appSuccess,
        cornerRadius: CGFloat = AppConstants.Layout.cornerRadius12
    ) -> some View {
        self.modifier(
            ButtonModifier(
                fontSize: fontSize,
                textColor: textColor,
                backgroundColor: backgroundColor,
                cornerRadius: cornerRadius
            )
        )
    }
}
