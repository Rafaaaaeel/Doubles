//
//  SignupErros.swift
//  Doubles
//
//  Created by Rafael Oliveira on 15/07/22.
//

import Foundation

enum SignupError: LocalizedError, Equatable{
    case invalidReponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self{
        case .failedRequest(let description):
            return description
        case .invalidReponseModel,.invalidRequestURLString:
            return ""
        }
    }
}
