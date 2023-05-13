//
//  ViewController.swift
//  Protocol Oriented Programming (Network Request)
//
//  Created by Israel Manzo on 5/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let imagePhoto: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TEXT"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        
        view.addSubview(imagePhoto)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imagePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePhoto.widthAnchor.constraint(equalToConstant: 200),
            imagePhoto.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: imagePhoto.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: imagePhoto.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

