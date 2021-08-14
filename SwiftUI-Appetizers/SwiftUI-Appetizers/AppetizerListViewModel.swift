//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []

    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { // <<<< Main because setting data triggers a UI Update
                switch result {
                case .success(let appetizerResult):
                    self.appetizers = appetizerResult
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }
    }
}
