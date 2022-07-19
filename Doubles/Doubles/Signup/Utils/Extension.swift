//
//  Extension.swift
//  Doubles
//
//  Created by Rafael Oliveira on 18/07/22.
//

import Foundation

extension String{
    var lenghIsRight: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^[^-\\s][\\p{L}\\-'\\s]{2,9}$").evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

