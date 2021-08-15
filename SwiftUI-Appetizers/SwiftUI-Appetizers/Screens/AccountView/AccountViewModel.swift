//
//  AccountViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/14/21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            let retrievedUser = try JSONDecoder().decode(User.self, from: userData)
            user = retrievedUser
        }
        catch {
            alertItem = AlertContext.invalidUserData
        }
    }

    // Text Validation
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else  {
            alertItem = AlertContext.invalidForm
            return false
        }
            
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidFormEmail
            return false
        }
        
        return true
    }
    
}
