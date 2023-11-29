//
//  BundleInfo.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct BundleInfo {
    let CFBundleShortVersionString: String
    let CFBundleVersion: String
    let CFBundleIdentifier: String
    let DTAppStoreToolsBuild: String
}

extension BundleInfo: Codable { }
