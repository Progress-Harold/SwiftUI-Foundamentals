//
//  User.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/14/21.
//

import Foundation


struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
