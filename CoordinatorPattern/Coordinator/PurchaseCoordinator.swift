//
//  PurchaseCoordinator.swift
//  CoordinatorPattern
//
//  Created by Aamir on 22/09/2024.
//

import Combine
import SwiftUI

final class PurchaseCoordinator: ObservableObject {
    unowned var parent: ItemsCoordinator
    @Published var path: [PurchaseSteps] = []
    
    init(parent: ItemsCoordinator) {
        self.parent = parent
    }
    
    func navigateToSelectPaymentMethod() {
        path.append(PurchaseSteps.selectPaymentMethod)
    }
    
    func navigateToSelectBuyItem() {
        path.append(PurchaseSteps.buyItem)
    }
    
    func navigateToPurchaseSummary() {
        path.append(PurchaseSteps.summary)
    }
    
    func goBack() {
        path.removeLast()
    }
}

extension PurchaseCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: PurchaseSteps) -> some View {
        switch path {
        case .addToCart:
            let viewModel = AddToCartViewModel(coordinator: self, detailText: "Add to cart")
            AddToCartView(viewModel: viewModel)
        case .selectPaymentMethod:
            let viewModel = PaymentMethodViewModel(coordinator: self, detailText: "Select Payment Method")
            PaymentMethodView(viewModel: viewModel)
        case .buyItem:
            let viewModel = BuyItemViewModel(coordinator: self, detailText: "Select Payment Method")
            BuyItemView(viewModel: viewModel)
        case .summary:
            Text("Purchase summary")
        }
    }
}
