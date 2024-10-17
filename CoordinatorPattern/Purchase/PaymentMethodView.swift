//
//  PaymentMethodView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 22/09/2024.
//

import SwiftUI

final class PaymentMethodViewModel: Identifiable {
    let id = UUID()
    let detailText: String
    let coordinator: PurchaseCoordinator
    
    init(coordinator: PurchaseCoordinator, detailText: String) {
        self.coordinator = coordinator
        self.detailText = detailText
    }
}

struct PaymentMethodView: View {
    let viewModel: PaymentMethodViewModel

    var body: some View {
        Text(viewModel.detailText)
        Button("Buy Item") {
            viewModel.coordinator.navigateToSelectBuyItem()
        }
    }
}

#Preview {
    PaymentMethodView(viewModel: PaymentMethodViewModel(coordinator: PurchaseCoordinator(parent: ItemsCoordinator()), detailText: ""))
}
