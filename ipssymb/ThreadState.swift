//
//  ThreadState.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct ThreadState {
    let x: [Register]
    let flavor: String
    let lr: Register
    let cpsr: Register
    let fp: Register
    let sp: Register
    let esr: Register
    let pc: Register
    let far: Register
}

extension ThreadState: Codable { }
