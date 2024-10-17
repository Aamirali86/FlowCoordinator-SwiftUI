//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Aamir on 20/09/2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype CoordinatorSteps: Steps
    associatedtype CoordinatorView: View

    var path: [CoordinatorSteps] { get set }

    func redirect(_ path: CoordinatorSteps) -> CoordinatorView
}
