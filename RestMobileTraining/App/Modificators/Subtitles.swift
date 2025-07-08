//
//  Subtitles.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

enum FontSizeSubTitles: CGFloat, CaseIterable {
    case size18 = 18.0
    case size20 = 20.0
    
    var value: CGFloat {
        return self.rawValue
    }
}

struct SubTitles: ViewModifier {
    let fontSize: FontSizeSubTitles
    let color: Color
    let alignment: Alignment
    
    init(fontSize: FontSizeSubTitles = .size18, color: Color = .appTextPrimary, alignment: Alignment = .leading) {
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

