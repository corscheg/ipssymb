//
//  ASI.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct ASI {
    let libdispatchDylib: [String]
}

extension ASI: Codable {
    enum CodingKeys: String, CodingKey {
        case libdispatchDylib = "libdispatch.dylib"
    }
}
