//
//  NetworkErrors.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-31.
//

import Foundation

enum NetworkErrors: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
