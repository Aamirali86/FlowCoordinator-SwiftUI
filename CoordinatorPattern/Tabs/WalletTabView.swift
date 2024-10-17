//
//  WalletTabView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class WalletTabViewModel: ObservableObject {
    @Published var coordinator: WalletCoordinator
    
    init(coordinator: WalletCoordinator) {
        self.coordinator = coordinator
    }
}

struct WalletTabView: View {
    @ObservedObject var viewModel: WalletTabViewModel
    
    var body: some View {
        VStack {
            Text("Wallet Tab")
            Button("Go to wallet detail") {
                viewModel.coordinator.navigateToDetail()
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
