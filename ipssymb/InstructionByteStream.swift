//
//  InstructionByteStream.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct InstructionByteStream {
    let beforePC: String
    let atPC: String
}

extension InstructionByteStream: Codable { }
