//
//  Collection+.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        guard index >= startIndex, index < endIndex else { return nil }
        return self[index]
    }
}
