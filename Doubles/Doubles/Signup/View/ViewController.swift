//
//  ViewController.swift
//  Doubles
//
//  Created by Rafael Oliveira on 15/07/22.
//

import UIKit

class ViewController: UITabBarController {

    
    let nome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rafael"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(nome)
        
        NSLayoutConstraint.activate([
            nome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nome.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}



