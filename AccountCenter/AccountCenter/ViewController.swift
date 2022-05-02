//
//  ViewController.swift
//  AccountCenter
//
//  Created by Rafael Oliveira on 29/04/22.
//

import UIKit

class ViewController: UIViewController {

    public lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 80))
        textField.leftViewMode = .always
        return textField
    }()
    
    public lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 80))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    public lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: [])
        button.configuration = .filled()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    public var stackvView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        additional()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy(){
        
        stackvView.addArrangedSubview(usernameTextField)
        stackvView.addArrangedSubview(passwordTextField)
        stackvView.addArrangedSubview(logInButton)
        view.addSubview(stackvView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            stackvView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackvView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.trailingAnchor, multiplier: 1),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func additional(){
        view.backgroundColor = .systemBackground
    }

}


extension ViewController{
    @objc func login(_ sender: UIButton){
        shouldLogin()
    }
    
    private func shouldLogin(){
        guard let email = usernameTextField.text, let password = passwordTextField.text, email == "rafael", password == "123" else {
            let alert = UIAlertController(title: "Invalid Login", message: "Your login credentials were incorrect. Try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
            
            return
        }
        
        let vc = LoggedViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}

class LoggedViewController: UIViewController{
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        additional()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy(){
        view.addSubview(label)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func additional(){
        view.backgroundColor = .systemGreen
    }
    
    
    
}
