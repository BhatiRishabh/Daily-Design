//
//  UnsplashImage.swift
//  Daily Design
//
//  Created by Rishabh Kumar on 26/01/26.
//


import Foundation

struct UnsplashImage: Identifiable, Codable {
    let id: String
    let urls: ImageURLs
    let user: Photographer
}

struct ImageURLs: Codable {
    let regular: String
    let small: String
}

struct Photographer: Codable {
    let name: String
    let username: String
}