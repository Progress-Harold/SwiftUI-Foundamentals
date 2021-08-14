//
//  BarcodeScannerViewModel.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Lee Davis on 8/12/21.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = "" // broadcasting changes
    @State var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
