//
//  GFButton.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 25.04.2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline) // users preffered font size
        translatesAutoresizingMaskIntoConstraints = false // have to add that line when programatic UI
    }
    
}
