//
//  AFButton.swift
//  Apple-Framworks
//
//  Created by Lee Davis on 8/12/21.
//

import SwiftUI

struct AFButton: View {
    var title: String
    
    var body: some View {
     
        VStack {
            Text("Learn More")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50) // Order matters
                .background(Color.red) // these are "Modifiers"
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Test Title")
    }
}
