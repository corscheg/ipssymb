//
//  FactorPackID.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct FactorPackID {
    let SIRI_TEXT_TO_SPEECH: String?
    let SIRI_AUDIO_DISABLE_MEDIA_ENTITY_SYNC: String?
}

extension FactorPackID: Codable { }
