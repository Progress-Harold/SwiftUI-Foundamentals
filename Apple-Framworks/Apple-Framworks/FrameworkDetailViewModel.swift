//
//  FrameworkDetailViewModel.swift
//  Apple-Framworks
//
//  Created by Lee Davis on 8/14/21.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {

    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published private var isShowingSafariView = false

    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    } 
}
