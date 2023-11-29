//
//  TrialInfo.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct TrialInfo {
    let rollouts: [Rollout]
    let experiments: [Experiment]
}

extension TrialInfo: Codable { }
