//
//  SecondTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class WalletCoordinator: ObservableObject {
    @Published var path:[WalletSteps] = []
    
    func navigateToDetail() {
        path.append(WalletSteps.detail)
    }
    
    func goBack() {
        path.removeLast()
    }
}

extension WalletCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: WalletSteps) -> some View {
        switch path {
        case .detail:
            let viewModel = WalletViewModel(coordinator: self, detailText: "Wallet details")
            WalletView(viewModel: viewModel)
                .navigationBarBackButtonHidden()
        }
    }
}
