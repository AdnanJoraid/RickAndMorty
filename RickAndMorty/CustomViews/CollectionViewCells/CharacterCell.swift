//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-23.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    let characterName: String = "Rick"
    static let reuseID = "CharacterCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
}
