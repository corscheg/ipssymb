//
//  StoreInfo.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct StoreInfo {
    let itemID: String
    let storeCohortMetadata: String
    let entitledBeta: Bool
    let deviceIdentifierForVendor: String
    let softwareVersionExternalIdentifier: String
    let applicationVariant: String
    let thirdParty: Bool
}

extension StoreInfo: Codable { }
