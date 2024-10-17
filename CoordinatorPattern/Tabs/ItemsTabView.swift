//
//  ItemsTabView.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

final class ItemsTabViewModel: ObservableObject {
    @Published var coordinator: ItemsCoordinator
    
    init(coordinator: ItemsCoordinator) {
        self.coordinator = coordinator
    }
}

struct ItemsTabView: View {
    @ObservedObject var viewModel: ItemsTabViewModel
    
    var body: some View {
        VStack {
            Text("Items Tab")
            Button("Go to Item Detail") {
                viewModel.coordinator.navigateToDetail()
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
