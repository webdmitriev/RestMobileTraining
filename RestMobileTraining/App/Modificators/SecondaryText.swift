//
//  SecondaryText.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct SecondaryText: ViewModifier {
    let fontSize: CGFloat
    let color: Color
    let alignment: Alignment
    
    init(fontSize: CGFloat = 14, color: Color = .appTextPrimary, alignment: Alignment = .leading) {
        self.fontSize = fontSize
        self.color = color
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize, weight: .regular))
            .frame(maxWidth: .infinity, alignment: alignment)
            .foregroundColor(color)
    }
}
