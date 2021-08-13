//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Lee Davis on 8/10/21.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .frame(width: 280, height: 50) // Order matters
                .background(backgroundColor) // these are "Modifiers"
                .cornerRadius(10)
            
            Text(title)
                .frame(width: 280, height: 50) // Order matters
                .background(backgroundColor) // these are "Modifiers"
                .cornerRadius(10)
        }
        .foregroundColor(textColor)
        .font(.system(size: 20, weight: .bold, design: .default))
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
