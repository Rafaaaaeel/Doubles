//
//  SignupFormModelValidator.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 18/07/22.
//

import XCTest
@testable import Doubles

class SignupFormModelValidatorTestCase: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_SignupFormModelValidator_WhenValidFirstNameIsProvided_ShouldReturnTrue() {
//      Given When and Then
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Rafael")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned false")
    }

    func test_SignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstnNameValid() should have returned FALSE fora  first name that is shorter then 2 charecter but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        let isFirstNameValid = sut.isFirstNameValid(firstName: "RafaelRafael")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstnNameValid() should have returned FALSE fora  first name that is longer then 10 charecter but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenFirstNameIsNil_ShouldReturnFalse(){
        let isFirstNameValid = sut.isLastNameValid(lastName: "")
        
        XCTAssertFalse(isFirstNameValid)
    }
    
    
    func test_SignupFormModelValidator_WhenValidLastNameIsProvided_ShouldReturnTrue() {
        let isLastNameValid = sut.isLastNameValid(lastName: "Pires")
        
        XCTAssertTrue(isLastNameValid)
    }
    
    func test_SignupFormModelValidator_WhenTooShortLastNameIsProvided_shouldReturnFalse(){
        let isLastNameValid = sut.isLastNameValid(lastName: "P")
        
        XCTAssertFalse(isLastNameValid)
    }
    
    func test_SignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse(){
        let isLastNameValid = sut.isLastNameValid(lastName: "OliveiraPiresTrautvein")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer then 10 charecter but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenLastNameIsNil_ShouldReturnFalse(){
        let isLasNameValid = sut.isLastNameValid(lastName: "")
        
        XCTAssertFalse(isLasNameValid)
    }
    
    
    func test_SignupFormModelValidator_WhenEmailProvidedIsValid_ShouldReturnTrue(){
        let isEmailValid = sut.isEmailValid(email: "rafaelo@icloud.com")
        
        XCTAssertTrue(isEmailValid)
    }
    
    
    func test_SignupFormModelValidator_WhenEmailProvidedDoesNotCotainAT_ShouldReturnFalse(){
        let isEmailValid = sut.isEmailValid(email: "rafaeloicloud.com")
        
        XCTAssertFalse(isEmailValid)
    }
    
    func test_SignupFormModelValidator_WhenEmailProvidedDoesNotCotainDotCom_ShouldReturnFalse(){
        let isEmailValid = sut.isEmailValid(email: "rafaeloicloud@")
        
        XCTAssertFalse(isEmailValid)
    }    
    
    
}
