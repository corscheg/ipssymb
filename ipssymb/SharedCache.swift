//
//  SharedCache.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct SharedCache {
    let base: UInt64
    let size: UInt64
    let uuid: String
}

extension SharedCache: Codable { }
