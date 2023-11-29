//
//  Register.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Register {
    let value: UInt64
    let description: String?
    let matchesCrashFrame: Int?
}

extension Register: Codable { }
