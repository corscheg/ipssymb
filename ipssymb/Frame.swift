//
//  Frame.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Frame {
    let imageOffset: Int
    var symbol: String?
    var symbolLocation: Int?
    let imageIndex: Int
}

extension Frame: Codable { }
