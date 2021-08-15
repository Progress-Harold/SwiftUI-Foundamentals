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
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍕 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(isShowingDetail: $viewModel.isShowingDetail,
                                    appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer)
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
