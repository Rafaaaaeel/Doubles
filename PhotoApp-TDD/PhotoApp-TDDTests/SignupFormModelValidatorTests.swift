//
//  SignupFormModelValidator.swift
//  PhotoApp-TDDTests
//
//  Created by Rafael Oliveira on 27/04/22.
//

import XCTest
@testable import PhotoApp_TDD

class SignupFormModelValidatorTests: XCTestCase {

    let usuario = DirigirUsuario()
    
    override func setUp() {
        super.setUp()
        
        
    }

    func testsUserModelCanDriveShouldReturnFalse(){
        let result = usuario.dirigir(idade: 12)
        
        XCTAssertFalse(result, "Failed fuction should return false because user cannot drive in this situation")
    }
    
    func testsUseModelCandDriveShouldReturnTrue(){
        let result = usuario.dirigir(idade: 30)
        
        XCTAssertTrue(result)
    }
}
