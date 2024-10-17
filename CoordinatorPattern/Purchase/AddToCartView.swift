//
//  AddToCartView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 22/09/2024.
//

import Combine
import SwiftUI

final class AddToCartViewModel: Identifiable {
    let id = UUID()
    let detailText: String
    let coordinator: PurchaseCoordinator

    init(coordinator: PurchaseCoordinator, detailText: String) {
        self.coordinator = coordinator
        self.detailText = detailText
    }
}

struct AddToCartView: View {
    @Environment(\.dismiss)
    private var dismiss
    let viewModel: AddToCartViewModel

    var body: some View {
        VStack {
            Text(viewModel.detailText)
            Button("Select payment Method") {
                viewModel.coordinator.navigateToSelectPaymentMethod()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}

#Preview {
    AddToCartView(viewModel: AddToCartViewModel(coordinator: PurchaseCoordinator(parent: ItemsCoordinator()), detailText: "Add to cart"))
}
