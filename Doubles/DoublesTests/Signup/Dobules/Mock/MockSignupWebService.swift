//
//  MockSignupWebService.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation
@testable import Doubles

class MockSignupWebService: SignupWebServiceProtocol{
 
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: Doubles.SignupFormRequestModel, completionHandler: @escaping (Doubles.SignupResponseModel?, Doubles.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        let responseModel = SignupResponseModel(status: "Ok")
        
        completionHandler(responseModel, nil)
    }
}
