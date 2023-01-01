//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-23.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    let characterImageView = CharacterImageView(frame: .zero)
    let characterNameView = CharacterNameView(textAlignment: .center, fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(character: RMCharacter) {
        characterImageView.downloadImage(from: character.image)
        characterNameView.text = character.name
    }
    
    private func configure() {
        addSubview(characterImageView)
        addSubview(characterNameView)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            characterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor),
            
            characterNameView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 8),
            characterNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            characterNameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            characterNameView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
