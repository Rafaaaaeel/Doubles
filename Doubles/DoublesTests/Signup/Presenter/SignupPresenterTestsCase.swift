//
//  SignupPresenterTestsCase.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 25/07/22.
//

import XCTest
@testable import Doubles

final class SignupPresenterTestsCase: XCTestCase {

    var sut: SignupPresenter!
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator:MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUp() {
        signupFormModel = SignupFormModel(
            firstName: "Rafael",
            lastName: "Pires",
            email: "rafaelopires@icloud.com",
            password: "123456789",
            repeatPassword: "123456789"
        )
        mockSignupViewDelegate = MockSignupViewDelegate()
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webSerice: mockSignupWebService, delegate: mockSignupViewDelegate)
        sut.processUserSignup(formModel: signupFormModel)
        
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }
    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty(){
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordsMached, "Did not validate if passwords match")
    }

    
    func test_SignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was no called in the SignupWebService class")
    }
    
    func test_SignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate(){
        // Arrange
        let expectation = expectation(description: "Expected the successFulSignup() method to be called")
        
        
        mockSignupViewDelegate.expectation = expectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
    }
}
