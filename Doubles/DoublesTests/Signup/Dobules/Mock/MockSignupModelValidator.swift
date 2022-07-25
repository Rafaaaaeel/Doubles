//
//  MockSignupModelValidator.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation
@testable import Doubles

class MockSignupModelValidator: SignupModelValidatorProtocol{
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordsMached: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordsMached = true
        return isPasswordsMached
    }
    
    
}
