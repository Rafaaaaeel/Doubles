//
//  SignupFormModelValidator.swift
//  Doubles
//
//  Created by Rafael Oliveira on 18/07/22.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol{
    
    func isFirstNameValid(firstName: String) -> Bool{
        
        if firstName.lenghIsRight{
            return true
        }
        
        return false
    }
    
    func isLastNameValid(lastName: String) -> Bool{
        
        if lastName.lenghIsRight{
            return true
        }
        
        return false
    }
    
    func isEmailValid(email: String) -> Bool{
        
        if email.isValidEmail{
            return true
        }
        
        return false
        
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool{
        return password == repeatPassword
    }
}


