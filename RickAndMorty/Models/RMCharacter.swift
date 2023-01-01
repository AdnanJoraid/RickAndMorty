//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-31.
//

import Foundation

struct RMCharacter: Decodable {
    let id: Int
    let name: String
    let image: String
}

struct RMCharacters: Decodable {
    var results: [RMCharacter]
}
