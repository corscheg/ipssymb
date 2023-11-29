//
//  OSVersion.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct OSVersion {
    let isEmbedded: Bool
    let train: String
    let releaseType: String
    let build: String
}

extension OSVersion: Codable { }
