//
//  FrameworkDetailView.swift
//  Apple-Framworks
//
//  Created by Lee Davis on 8/10/21.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                    
                }
            }
            .padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding(20)
            
            Spacer()
            
//            Link(destination: URL(string: framework.urlString)!) {
//                AFButton(title: "Learn More")
//            }

            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: framework.name)
            }
            
        }
        .sheet(isPresented: $isShowingSafariView) {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            }
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockframework: Framework =  {
            return MockData.frameworks.first ?? Framework(name: "",
                                                          imageName: "",
                                                          urlString: "",
                                                          description: "")
        }()
        
        FrameworkDetailView(framework: mockframework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
