//
//  DetailView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class DetailViewModel: Identifiable {
    let id = UUID()
    let detailText: String
    var coordinator: ItemsCoordinator
    
    init(coordinator: ItemsCoordinator, detailText: String) {
        self.coordinator = coordinator
        self.detailText = detailText
    }
}

struct DetailView: View {
    let viewModel: DetailViewModel
    @State private var step: ItemSteps?
    
    var body: some View {
        VStack {
            Text(viewModel.detailText)
                .font(.largeTitle)
            Button("Add to cart") {
                step = .addToCart
            }
        }
        .fullScreenCover(item: $step) { step in
            viewModel.coordinator.redirect(step)
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
