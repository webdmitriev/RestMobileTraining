//
//  ContentView.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                header
                    .padding(.horizontal, AppConstants.Layout.offsetPage)
                
                Spacer()
            }
            .background(.appBackground)
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

