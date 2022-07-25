//
//  SignupWebServiceProtocol.swift
//  Doubles
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation


protocol SignupWebServiceProtocol{
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
