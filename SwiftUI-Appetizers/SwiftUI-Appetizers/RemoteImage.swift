//
//  RemoteImage.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

// Observable obj

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(urlString: urlString) { image in
            guard let image = image else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
