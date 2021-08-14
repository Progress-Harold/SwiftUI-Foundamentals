//
//  ScannerView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Lee Davis on 8/12/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }

    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
            
            scannerView.scannedCode = ""
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        
        ScannerView(scannedCode: .constant("475637856"),
                    alertItem: .constant(AlertContext.invalidDeviceInput))
    }
}
