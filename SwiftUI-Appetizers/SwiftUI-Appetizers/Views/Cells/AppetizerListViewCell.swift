//
//  AppetizerListViewCell.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

struct AppetizerListViewCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(idealWidth: 120, idealHeight: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListViewCell(appetizer: MockData.sampleAppetizer)
    }
}
