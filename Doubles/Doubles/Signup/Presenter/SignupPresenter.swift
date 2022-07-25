//
//  SignupPresenter.swift
//  Doubles
//
//  Created by Rafael Oliveira on 25/07/22.
//

import Foundation

class SignupPresenter{
    
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(formModelValidator: SignupModelValidatorProtocol, webSerice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol){
        self.formModelValidator = formModelValidator
        self.webService = webSerice
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName){
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName){
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email){
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self](responseModel, error) in
            // TODO
            
            if let _ = responseModel {
                self?.delegate?.successFullSignup()
                return
            }
        }
    }
}
