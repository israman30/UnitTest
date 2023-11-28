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

class OutletsViewController: UIViewController {
    
    @IBOutlet private(set) var label: UILabel!
    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        print(">> Button tapped!")
    }
    
}

protocol UserDefaultProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultInteger: String) -> Int
}

class UserDefaultViewController: UIViewController {
    
    @IBOutlet private(set) var counter: UILabel!
    @IBOutlet private(set) var incrementLabel: UILabel!
    
    /// Isolate User defaults with `Dependency Injection`
    var userDefaults = UserDefaults.standard
    
    let incrementButton = UIButton(type: .system)
    
    private var count = 0 {
        didSet {
            counter.text = "\(count)"
            userDefaults.set(count, forKey: "count")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = userDefaults.integer(forKey: "count")
        
        incrementButton.addTarget(self, action: #selector(incrementeAction), for: .touchUpInside)
    }
    
    @objc func incrementeAction() {
        count += 1
    }
    
}
