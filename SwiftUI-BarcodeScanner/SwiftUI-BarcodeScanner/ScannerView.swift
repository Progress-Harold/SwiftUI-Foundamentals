//
//  ScannerView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Lee Davis on 8/12/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
