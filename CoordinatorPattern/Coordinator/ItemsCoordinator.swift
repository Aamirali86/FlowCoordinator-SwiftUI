//
//  ItemsCoordinator.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class ItemsCoordinator: ObservableObject {
    @Published var path: [ItemSteps] = []
    
    func goBack() {
        path.removeLast()
    }
    
    func navigateToDetail() {
        path.append(ItemSteps.detail)
    }
}

// MARK: - Coordinator
extension ItemsCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: ItemSteps) -> some View {
        switch path {
        case .detail:
            let viewModel = DetailViewModel(coordinator: self, detailText: "Item details")
            DetailView(viewModel: viewModel)
                .navigationBarBackButtonHidden()
        case .addToCart:
            let coordinator = PurchaseCoordinator(parent: self)
            coordinator.redirect(PurchaseSteps.addToCart)
        }
    }
}
