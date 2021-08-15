//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async { // <<<< Main because setting data triggers a UI Update
                isLoading = false
                switch result {
                case .success(let appetizerResult):
                    self.appetizers = appetizerResult
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
