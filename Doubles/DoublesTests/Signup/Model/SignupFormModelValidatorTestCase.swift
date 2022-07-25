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
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameIsValid() should have return FALSE for a last name that is empty but it has retured TRUE")
    }
    
    
    func test_SignupFormModelValidator_WhenValidLastNameIsProvided_ShouldReturnTrue() {
        let isLastNameValid = sut.isLastNameValid(lastName: "Pires")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameIsValid() should have returned TRUE for a last name that is valid but it has returned FALSE")
    }
    
    func test_SignupFormModelValidator_WhenTooShortLastNameIsProvided_shouldReturnFalse(){
        let isLastNameValid = sut.isLastNameValid(lastName: "P")
        
        XCTAssertFalse(isLastNameValid, "The islastNameValid() should have returned FALSE for a last name that is shorter then 2 character but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse(){
        let isLastNameValid = sut.isLastNameValid(lastName: "OliveiraPiresTrautvein")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer then 10 charecter but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenLastNameIsNil_ShouldReturnFalse(){
        let isLasNameValid = sut.isLastNameValid(lastName: "")
        
        XCTAssertFalse(isLasNameValid,"The lastNameIsValid() should have return FALSE for a last name that is empty but it has retured TRUE")
    }
    
    
    func test_SignupFormModelValidator_WhenEmailProvidedIsValid_ShouldReturnTrue(){
        let isEmailValid = sut.isEmailValid(email: "rafaelo@icloud.com")
        
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a email that is valid but it has returned FALSE")
    }
    
    
    func test_SignupFormModelValidator_WhenEmailProvidedDoesNotCotainAT_ShouldReturnFalse(){
        let isEmailValid = sut.isEmailValid(email: "rafaeloicloud.com")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a email that does not contain '@' but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenEmailProvidedDoesNotCotainDotCom_ShouldReturnFalse(){
        let isEmailValid = sut.isEmailValid(email: "rafaeloicloud@")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a email that does not contain '@' but it has returned TRUE")
    }
    
    func test_SignupFormModelValidator_WhenPasswordMatch_ShouldReturnTrue(){
        let passwordMatch = sut.doPasswordsMatch(password: "123456", repeatPassword: "123456")
        
        XCTAssertTrue(passwordMatch)
    }
    
    func test_SignupFormModelValidator_WhenPasswordDoesNotMatch_ShouldReturnTrue(){
        let passwordMatch = sut.doPasswordsMatch(password: "123456", repeatPassword: "12346")
        
        XCTAssertFalse(passwordMatch)
    }
    
    
}
