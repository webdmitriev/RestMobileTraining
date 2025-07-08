//
//  ScreenTitle.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

enum FontSizeTitles: CGFloat, CaseIterable {
    case size24 = 24.0
    case size26 = 26.0
    case size28 = 28.0
    case size30 = 30.0
    case size32 = 32.0
    
    var value: CGFloat {
        return self.rawValue
    }
}

struct Titles: ViewModifier {
    let fontSize: FontSizeTitles
    let color: Color
    let alignment: Alignment
    
    init(fontSize: FontSizeTitles = .size24, color: Color = .appTextPrimary, alignment: Alignment = .leading) {
        self.fontSize = fontSize
        self.color = color
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize.rawValue, weight: .bold))
            .frame(maxWidth: .infinity, alignment: alignment)
            .foregroundColor(color)
    }
}
