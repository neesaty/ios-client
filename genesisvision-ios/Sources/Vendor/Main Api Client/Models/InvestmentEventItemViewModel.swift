//
// InvestmentEventItemViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class InvestmentEventItemViewModel: Codable {

    public var title: String?
    public var amount: Double?
    public var currency: Currency?


    
    public init(title: String?, amount: Double?, currency: Currency?) {
        self.title = title
        self.amount = amount
        self.currency = currency
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(amount, forKey: "amount")
        try container.encodeIfPresent(currency, forKey: "currency")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        title = try container.decodeIfPresent(String.self, forKey: "title")
        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
    }
}

