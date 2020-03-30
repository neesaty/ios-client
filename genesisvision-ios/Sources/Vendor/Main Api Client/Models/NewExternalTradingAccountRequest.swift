//
// NewExternalTradingAccountRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class NewExternalTradingAccountRequest: Codable {

    public var brokerAccountTypeId: UUID?
    public var key: String?
    public var secret: String?


    
    public init(brokerAccountTypeId: UUID?, key: String?, secret: String?) {
        self.brokerAccountTypeId = brokerAccountTypeId
        self.key = key
        self.secret = secret
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(brokerAccountTypeId, forKey: "brokerAccountTypeId")
        try container.encodeIfPresent(key, forKey: "key")
        try container.encodeIfPresent(secret, forKey: "secret")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        brokerAccountTypeId = try container.decodeIfPresent(UUID.self, forKey: "brokerAccountTypeId")
        key = try container.decodeIfPresent(String.self, forKey: "key")
        secret = try container.decodeIfPresent(String.self, forKey: "secret")
    }
}
