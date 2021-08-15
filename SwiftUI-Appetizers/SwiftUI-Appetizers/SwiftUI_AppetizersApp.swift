//
//  SwiftUI_AppetizersApp.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

@main
struct SwiftUI_AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
