//
// RewardDetails.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class RewardDetails: Codable {

    public var date: Date?
    public var currency: Currency?
    public var amount: Double?


    
    public init(date: Date?, currency: Currency?, amount: Double?) {
        self.date = date
        self.currency = currency
        self.amount = amount
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(amount, forKey: "amount")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        date = try container.decodeIfPresent(Date.self, forKey: "date")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
    }
}

