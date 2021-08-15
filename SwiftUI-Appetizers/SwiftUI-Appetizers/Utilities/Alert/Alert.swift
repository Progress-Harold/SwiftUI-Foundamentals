//
//  Alert.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                            message: Text("The data recieved from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
   
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please inssure that all fields have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidFormEmail = AlertItem(title: Text("Invalid email"),
                                       message: Text("Inssure you have a valid email address."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile information has successfully saved."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Save Error"),
                                       message: Text("There was an error saving or retrieving your profile."),
                                       dismissButton: .default(Text("OK")))
}
