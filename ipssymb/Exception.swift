//
//  Exception.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Exception {
    let codes: String
    let rawCodes: [Int]
    let type: String
    let signal: String
}

extension Exception: Codable { }
