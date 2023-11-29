//
//  Experiment.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Experiment {
    let treatmentId: String
    let experimentId: String
    let deploymentId: Int
}

extension Experiment: Codable { }
