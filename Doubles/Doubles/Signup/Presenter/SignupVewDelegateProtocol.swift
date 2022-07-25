//
//  SignupVewDelegateProtocol.swift
//  Doubles
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation


protocol SignupViewDelegateProtocol: AnyObject{
    func successFullSignup()
    func errorHandle(error: SignupError)
}
