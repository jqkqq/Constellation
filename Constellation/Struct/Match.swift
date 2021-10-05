//
//  Match.swift
//  Constellation

import Foundation

// MARK: - Empty
struct Match: Codable {
    let reason: String
    let result: Result
    let errorCode: Int

    enum CodingKeys: String, CodingKey {
        case reason, result
        case errorCode = "error_code"
    }
}

// MARK: - Result
struct Result: Codable {
    let men, women, zhishu, bizhong: String
    let xiangyue, tcdj, jieguo, lianai: String
    let zhuyi: String
}
