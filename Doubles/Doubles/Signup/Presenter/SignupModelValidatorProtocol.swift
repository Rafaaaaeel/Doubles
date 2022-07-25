//
//  SignupModelValidatorProtocol.swift
//  Doubles
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation

protocol SignupModelValidatorProtocol{
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool

}
