//
//  SignupFormModelValidator.swift
//  PhotoApp-TDD
//
//  Created by Rafael Oliveira on 27/04/22.
//

import Foundation

class DirigirUsuario{
    
    
    func dirigir(idade: Int) -> Bool{
        if idade < 18{
            return false
        }
        
        return true
    }
    
}
