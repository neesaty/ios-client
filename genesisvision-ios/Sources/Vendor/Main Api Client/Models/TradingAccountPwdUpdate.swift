//
// TradingAccountPwdUpdate.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class TradingAccountPwdUpdate: Codable {

    public var password: String?
    public var twoFactorCode: String?


    
    public init(password: String?, twoFactorCode: String?) {
        self.password = password
        self.twoFactorCode = twoFactorCode
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(password, forKey: "password")
        try container.encodeIfPresent(twoFactorCode, forKey: "twoFactorCode")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        password = try container.decodeIfPresent(String.self, forKey: "password")
        twoFactorCode = try container.decodeIfPresent(String.self, forKey: "twoFactorCode")
    }
}

