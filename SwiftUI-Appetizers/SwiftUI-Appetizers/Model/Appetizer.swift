//
//  Appetizer.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import Foundation

/*
 "id": 1,
 "name": "Asian Flank Steak",
 "description": "This perfectly thin cut just melts in your mouth.",
 "price": 8.99,
 "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
 "calories": 300
 "protein": 14,
 "carbs": 0,
 */

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 300,
                                           protein: 14,
                                           carbs: 0)
    static let sampleAppetizer2 = Appetizer(id: 2,
                                           name: "Asian Flank 2",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 300,
                                           protein: 14,
                                           carbs: 0)
    static let sampleAppetizer3 = Appetizer(id: 3,
                                           name: "Asian Flank 3",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 300,
                                           protein: 14,
                                           carbs: 0)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer2, sampleAppetizer3]
}
