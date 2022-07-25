//
//  MockSignupViewDelegate.swift
//  DoublesTests
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation
import XCTest
@testable import Doubles
class MockSignupViewDelegate: SignupViewDelegateProtocol {
  
    
    var expectation: XCTestExpectation?
    
    func successFullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandle(error: Doubles.SignupError) {
        //
    }
}
