//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.appetizers.isEmpty ? MockData.appetizers : viewModel.appetizers,
                     id: \.id) { appetizer in
                    AppetizerListViewCell(appetizer: appetizer)
                }
                .navigationTitle("🍕 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
