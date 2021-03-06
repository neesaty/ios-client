//
// CreateWithdrawalRequestModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class CreateWithdrawalRequestModel: Codable {

    public var amount: Double?
    public var currency: Currency?
    public var address: String?
    public var twoFactorCode: String?


    
    public init(amount: Double?, currency: Currency?, address: String?, twoFactorCode: String?) {
        self.amount = amount
        self.currency = currency
        self.address = address
        self.twoFactorCode = twoFactorCode
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(amount, forKey: "amount")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(address, forKey: "address")
        try container.encodeIfPresent(twoFactorCode, forKey: "twoFactorCode")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        address = try container.decodeIfPresent(String.self, forKey: "address")
        twoFactorCode = try container.decodeIfPresent(String.self, forKey: "twoFactorCode")
    }
}

