//
//  ViewController.swift
//  Protocol Oriented Programming (Network Request)
//
//  Created by Israel Manzo on 5/12/23.
//

import UIKit

protocol ViewModelProtocol: AnyObject {
    func updateView(imageUrl: String, email: String)
}

class ViewModel {
    
    weak var viewModelProtocol: ViewModelProtocol?
    
    private let networkManager: NetworkManager
    
    init(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchUsers() {
        NetworkManager.shared.getUser { [weak self] user in
            switch user {
            case .success(let user):
                self?.viewModelProtocol?.updateView(imageUrl: user.avatar, email: user.email)
            case .failure(let error):
                print(error.localizedDescription)
                self?.viewModelProtocol?.updateView(imageUrl: "placeholder", email: "no user found")
            }
        }
    }
}

class ViewController: UIViewController, ViewModelProtocol {
    
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
    
    private let vm: ViewModel
    
    init(vm: ViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
        vm.viewModelProtocol = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        vm.fetchUsers()
    }
    
    func updateView(imageUrl: String, email: String) {
        let imageData = try! NSData(contentsOf: URL(string: imageUrl)!) as Data
        self.imagePhoto.image = UIImage(data: imageData)
        self.titleLabel.text = email
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
struct UserResonse: Decodable {
    let data: User
}
struct User: Decodable {
    let id: Int
    let email: String
    let avatar: String
}
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getUser(completion: @escaping(Result<User, Error>)->()) {
        let url = URL(string: "https://reqres.in/api/users/2")!
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode(UserResonse.self, from: data).data {
                    completion(.success(user))
                } else {
                    completion(.failure(error!))
                }
            }
        }.resume()
    }
}

