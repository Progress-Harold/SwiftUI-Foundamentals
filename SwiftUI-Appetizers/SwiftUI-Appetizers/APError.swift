//
//  APError.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse // 404
    case invalidData
    case unableToComplete
}
