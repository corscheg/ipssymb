//
//  Termination.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Termination {
    let flags: Int
    let code: Int
    let namespace: String
    let indicator: String
    let byProc: String
    let byPid: Int
}

extension Termination: Codable { }
