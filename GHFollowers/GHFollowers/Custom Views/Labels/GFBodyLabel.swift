//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 6.05.2024.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not have been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.75 //içeriğin orijinal boyutunun en fazla küçültülebileceği oran
        lineBreakMode               = .byWordWrapping  //omeroguz /n celikel
        translatesAutoresizingMaskIntoConstraints = false
    }

}
