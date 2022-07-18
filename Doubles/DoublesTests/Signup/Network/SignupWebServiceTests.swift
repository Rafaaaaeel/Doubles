//
//  DoublesTests.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 15/07/22.
//

import XCTest
@testable import Doubles

class DoublesTests: XCTestCase{

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users", urlSession: urlSession)
        
        signFormRequestModel = SignupFormRequestModel(firstName: "Rafael", lastName: "Pires", email:"rafaelo@icloud.com", password: "123456789")
        
    }

    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func test_SigupnWebService_WhenGivenSuccessfullResponse_ReturSuccesss(){
        
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test_SigupnWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        
        let jsonString = "{\"path\":\"/users\",\"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "The rsponse model for a resqust containg uknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidReponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test_SigupnWebService_WhenEmptyURLStringProvided_ReturnsError(){
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error)  in
            
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, te response model must be nil")
            expectation.fulfill()
        }
     
        self.wait(for: [expectation], timeout: 2)
        
    }
    
    func test_SigupnWebService_WhenURLRequestFails_ReurnsErrorMessageDescription(){
        // Arrage
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : errorDescription])
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
}
