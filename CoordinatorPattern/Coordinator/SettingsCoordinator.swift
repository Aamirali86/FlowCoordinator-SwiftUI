//
//  ThirdTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class SettingsCoordinator: ObservableObject {
    @Published var path:[SettingSteps] = []
    
    func navigateToDetail() {
        path.append(SettingSteps.profile)
    }
    
    func goBack() {
        path.removeLast()
    }
}

extension SettingsCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: SettingSteps) -> some View {
        switch path {
        case .profile:
            let viewModel = ProfileViewModel(coordinator: self, detailText: "Profile view")
            ProfileView(viewModel: viewModel)
                .navigationBarBackButtonHidden()
        }
    }
}
