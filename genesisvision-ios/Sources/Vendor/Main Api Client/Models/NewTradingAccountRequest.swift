//
// NewTradingAccountRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class NewTradingAccountRequest: Codable {

    public var depositAmount: Double?
    public var depositWalletId: UUID?
    public var currency: Currency?
    public var leverage: Int?
    public var brokerAccountTypeId: UUID?


    
    public init(depositAmount: Double?, depositWalletId: UUID?, currency: Currency?, leverage: Int?, brokerAccountTypeId: UUID?) {
        self.depositAmount = depositAmount
        self.depositWalletId = depositWalletId
        self.currency = currency
        self.leverage = leverage
        self.brokerAccountTypeId = brokerAccountTypeId
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(depositAmount, forKey: "depositAmount")
        try container.encodeIfPresent(depositWalletId, forKey: "depositWalletId")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(leverage, forKey: "leverage")
        try container.encodeIfPresent(brokerAccountTypeId, forKey: "brokerAccountTypeId")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        depositAmount = try container.decodeIfPresent(Double.self, forKey: "depositAmount")
        depositWalletId = try container.decodeIfPresent(UUID.self, forKey: "depositWalletId")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        leverage = try container.decodeIfPresent(Int.self, forKey: "leverage")
        brokerAccountTypeId = try container.decodeIfPresent(UUID.self, forKey: "brokerAccountTypeId")
    }
}

