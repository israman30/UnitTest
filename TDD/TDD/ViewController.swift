//
//  ViewController.swift
//  TDD
//
//  Created by Israel Manzo on 9/28/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class User {
    func validate(with email: String, and confirm: String) -> Bool {
        guard !email.isEmpty && !confirm.isEmpty else { return false }
        if email == confirm {
            return true
        }
        return false
    }
    
    func user(name: String, last: String) -> String {
        return "\(name) \(last)"
    }
}
