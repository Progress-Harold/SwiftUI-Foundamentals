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
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
