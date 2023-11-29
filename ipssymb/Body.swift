//
//  Body.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

struct Body {
    let uptime: Int
    let procRole: String
    let version: Int
    let userID: Int
    let deployVersion: Int
    let modelCode: String
    let coalitionID: Int
    let osVersion: OSVersion
    let captureTime: String
    let codeSigningMonitor: Int
    let incident: String
    let pid: Int
    let cpuType: String
    let roots_installed: Int
    let bug_type: String
    let procLaunch: String
    let procStartAbsTime: UInt64
    let procExitAbsTime: UInt64
    let procName: String
    let procPath: String
    let bundleInfo: BundleInfo
    let storeInfo: StoreInfo
    let parentProc: String
    let parentPid: Int
    let coalitionName: String
    let isBeta: Int
    let wasUnlockedSinceBoot: Int
    let isLocked: Int
    let codeSigningID: String
    let codeSigningTeamID: String
    let codeSigningFlags: Int
    let codeSigningValidationCategory: Int
    let codeSigningTrustLevel: Int
    let instructionByteStream: InstructionByteStream
    let basebandVersion: String
    let exception: Exception
    let termination: Termination?
    let os_fault: OSFault?
    let asi: ASI
    let faultingThread: Int
    var threads: [Thread]
    let usedImages: [Image]
    let sharedCache: SharedCache
    let vmSummary: String
    let legacyInfo: LegacyInfo
    let logWritingSignature: String
    let trialInfo: TrialInfo
}

extension Body: Codable { }
