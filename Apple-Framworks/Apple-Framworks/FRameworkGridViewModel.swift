//
//  FRameworkGridViewModel.swift
//  Apple-Framworks
//
//  Created by Lee Davis on 8/12/21.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    
    @Published var isShowingDetailView = false
}
