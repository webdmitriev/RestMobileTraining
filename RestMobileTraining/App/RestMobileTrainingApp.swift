//
//  RestMobileTrainingApp.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

@main
struct RestMobileTrainingApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(appState)
        }
    }
}

class AppState: ObservableObject {
    @Published var isTabBarVisible: Bool = true
}
