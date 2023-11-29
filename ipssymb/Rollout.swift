//
//  Rollout.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Rollout {
    let rolloutId: String
    let factorPackIds: FactorPackID
    let deploymentId: Int
}

extension Rollout: Codable { }
