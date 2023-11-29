//
//  Thread.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Thread {
    let triggered: Bool?
    let id: Int
    let queue: String?
    let name: String?
    let threadState: ThreadState
    var frames: [Frame]
}

extension Thread: Codable { }
