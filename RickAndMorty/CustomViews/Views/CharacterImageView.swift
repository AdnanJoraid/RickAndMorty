//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-31.
//

import UIKit

class CharacterImageView: UIImageView {
    let placeholderImage = UIImage(named: "launch-image")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 52
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        loadImageFromURL(urlString: urlString)
    }
}

