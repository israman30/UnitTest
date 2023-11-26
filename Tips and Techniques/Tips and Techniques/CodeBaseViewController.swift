//
//  CodeBaseViewController.swift
//  Tips and Techniques
//
//  Created by Israel Manzo on 11/25/23.
//

import UIKit


class CodeBaseViewController: UIViewController {
    
    private let data: String
    
    init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View is created.!")
    }
}
