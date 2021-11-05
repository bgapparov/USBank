//
//  Photo.swift
//  USBank
//
//  Created by Baiaman Gapparov on 11/4/21.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

