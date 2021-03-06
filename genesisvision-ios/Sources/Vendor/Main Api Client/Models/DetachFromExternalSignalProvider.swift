//
// DetachFromExternalSignalProvider.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class DetachFromExternalSignalProvider: Codable {

    public var tradingAccountId: UUID?


    
    public init(tradingAccountId: UUID?) {
        self.tradingAccountId = tradingAccountId
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(tradingAccountId, forKey: "tradingAccountId")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        tradingAccountId = try container.decodeIfPresent(UUID.self, forKey: "tradingAccountId")
    }
}

