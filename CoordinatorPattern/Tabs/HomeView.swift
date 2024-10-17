//
//  HomeView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var firstCoordinator = ItemsCoordinator()
    @ObservedObject var secondCoordinator = WalletCoordinator()
    @ObservedObject var thirdCoordinator = SettingsCoordinator()

    var body: some View {
        TabView {
            ItemsTabView(viewModel: ItemsTabViewModel(coordinator: firstCoordinator))
                .tabItem {
                    Label("Tab 1", systemImage: "1.circle")
                }
            
            WalletTabView(viewModel: WalletTabViewModel(coordinator: secondCoordinator))
                .tabItem {
                    Label("Tab 2", systemImage: "2.circle")
                }
            
            SettingTabView(viewModel: SettingTabViewModel(coordinator: thirdCoordinator))
                .tabItem {
                    Label("Tab 3", systemImage: "3.circle")
                }
        }
    }
}

#Preview {
    HomeView()
}
