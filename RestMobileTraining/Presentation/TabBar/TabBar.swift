//
//  TabBar.swift
//  RestMobileTraining
//
//  Created by Олег Дмитриев on 08.07.2025.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let icon: String
    let iconActive: String
    let label: String
}

struct TabBar: View {
    @EnvironmentObject var appState: AppState
    @StateObject var workoutManager = WorkoutManager.shared

    @State private var selectedTabIndex: Int = 0
    
    let tabs: [TabItem] = [
        TabItem(icon: "home", iconActive: "home-active", label: "Home"),
        TabItem(icon: "timer", iconActive: "timer-active", label: "Timer"),
        TabItem(icon: "history", iconActive: "history-active", label: "History"),
        TabItem(icon: "profile", iconActive: "profile-active", label: "Profile")
        
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            tabContentView
                .edgesIgnoringSafeArea(.all)

            tabBarView
        }
        .frame(maxWidth: .infinity)
        .padding(0)
        .ignoresSafeArea(edges: .all)
    }
    
    @ViewBuilder
    private var tabContentView: some View {
        switch selectedTabIndex {
        case 0:
            let dataSource = RemoteWorkoutsSourceImpl()
            let repo = FetchWorkoutsRepositoryImpl(dataSource: dataSource)
            let useCase = FetchWorkoutsUseCaseImpl(repository: repo)
            HomeView(viewModel: HomeViewModel(getMockDataUseCase: useCase))
                .environmentObject(appState)
        case 1:
            HistoryView()
                .environmentObject(appState)
        case 2:
            TimerView()
                .environmentObject(appState)
        case 3:
            ProfileView()
                .environmentObject(appState)
                .environmentObject(workoutManager)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var tabBarView: some View {
        if appState.isTabBarVisible {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    let tab = tabs[index]
                    TabBarButton(
                        icon: selectedTabIndex == index ? tab.iconActive : tab.icon,
                        label: tab.label,
                        isActive: selectedTabIndex == index
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedTabIndex = index
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 12)
            .background(Color.appTextPrimary)
            .frame(height: 110)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -5)
            .transition(.move(edge: .bottom))
        }
    }
}

struct TabBarButton: View {
    let icon: String
    let label: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(icon)
                    //.renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    //.foregroundColor(isActive ? .appWhite : .appWhite.opacity(0.4))
                
                Text(label)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(isActive ? .appWhite : .appWhite.opacity(0.6))
            }
            .padding(.vertical, 8)
        }
    }
}
