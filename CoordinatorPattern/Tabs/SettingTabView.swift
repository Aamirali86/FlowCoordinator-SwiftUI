//
//  SettingTabView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class SettingTabViewModel: ObservableObject {
    @Published var coordinator: SettingsCoordinator
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }
}

struct SettingTabView: View {
    @ObservedObject var viewModel: SettingTabViewModel
    
    var body: some View {
        VStack {
            Text("Settings Tab")
            Button("Go to profile") {
                viewModel.coordinator.navigateToDetail()
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
