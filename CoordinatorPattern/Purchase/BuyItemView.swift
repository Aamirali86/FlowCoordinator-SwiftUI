//
//  BuyItemView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 22/09/2024.
//

import SwiftUI

final class BuyItemViewModel: Identifiable {
    let id = UUID()
    let detailText: String
    var coordinator: PurchaseCoordinator
    
    init(coordinator: PurchaseCoordinator, detailText: String) {
        self.coordinator = coordinator
        self.detailText = detailText
    }
}

struct BuyItemView: View {
    let viewModel: BuyItemViewModel
    
    var body: some View {
        Text(viewModel.detailText)
        Button("Go to summary") {
            viewModel.coordinator.navigateToPurchaseSummary()
        }
    }
}

#Preview {
    BuyItemView(viewModel: BuyItemViewModel(coordinator: PurchaseCoordinator(parent: ItemsCoordinator()), detailText: ""))
}
