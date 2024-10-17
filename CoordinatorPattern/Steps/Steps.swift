//
//  Steps.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import Foundation

protocol Steps: Equatable, Hashable {}

enum ItemSteps: Steps {
    case detail
    case addToCart
}

enum WalletSteps: Steps {
    case detail
}

enum SettingSteps: Steps {
    case profile
}

enum PurchaseSteps: Steps {
    case addToCart
    case selectPaymentMethod
    case buyItem
    case summary
}

extension ItemSteps: Identifiable {
    var id: String {
        switch self {
        case .detail:
            "itemDetails"
        case .addToCart:
            "addToCart"
        }
    }
}

extension PurchaseSteps: Identifiable {
    var id: String {
        switch self {
        case .addToCart:
            "addToCart"
        case .selectPaymentMethod:
            "selectPaymentMethod"
        case .buyItem:
            "buyItem"
        case .summary:
            "summary"
        }
    }
}
