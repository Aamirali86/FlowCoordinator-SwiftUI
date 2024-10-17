//
//  ProfileView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 22/09/2024.
//

import SwiftUI

final class ProfileViewModel: Identifiable {
    let id = UUID()
    let detailText: String
    var coordinator: SettingsCoordinator
    
    init(coordinator: SettingsCoordinator, detailText: String) {
        self.coordinator = coordinator
        self.detailText = detailText
    }
}

struct ProfileView: View {
    let viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.detailText)
                .font(.largeTitle)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("<Back") {
                    viewModel.coordinator.goBack()
                }
            }
        }
    }
}
