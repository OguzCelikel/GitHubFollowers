//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 21.05.2024.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismssVC))
        navigationItem.rightBarButtonItem = doneButton
        
        print(username)
    }
    
    
    @objc func dismssVC() {
        dismiss(animated: true)
    }
}
