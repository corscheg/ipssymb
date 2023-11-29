//
//  Image.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Image {
    let source: String
    let arch: String?
    let base: Int
    let size: Int
    let uuid: String
    let path: String?
    let name: String?
}

extension Image: Codable { }
