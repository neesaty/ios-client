//
// MultiWalletTransaction.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class MultiWalletTransaction: Codable {

    public enum CurrencyFrom: String, Codable { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case ada = "ADA"
        case usdt = "USDT"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }
    public enum CurrencyTo: String, Codable { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case ada = "ADA"
        case usdt = "USDT"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }
    public enum ModelType: String, Codable { 
        case all = "All"
        case investment = "Investment"
        case converting = "Converting"
        case withdrawal = "Withdrawal"
        case close = "Close"
        case open = "Open"
        case fee = "Fee"
        case profits = "Profits"
    }
    public enum Status: String, Codable { 
        case done = "Done"
        case pending = "Pending"
        case canceled = "Canceled"
        case error = "Error"
    }
    public var id: UUID?
    public var currencyFrom: CurrencyFrom?
    public var currencyTo: CurrencyTo?
    public var type: ModelType?
    public var date: Date?
    public var status: Status?
    public var logoFrom: String?
    public var logoTo: String?
    public var description: String?
    public var amount: Double?
    public var amountTo: Double?


    
    public init(id: UUID?, currencyFrom: CurrencyFrom?, currencyTo: CurrencyTo?, type: ModelType?, date: Date?, status: Status?, logoFrom: String?, logoTo: String?, description: String?, amount: Double?, amountTo: Double?) {
        self.id = id
        self.currencyFrom = currencyFrom
        self.currencyTo = currencyTo
        self.type = type
        self.date = date
        self.status = status
        self.logoFrom = logoFrom
        self.logoTo = logoTo
        self.description = description
        self.amount = amount
        self.amountTo = amountTo
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(currencyFrom, forKey: "currencyFrom")
        try container.encodeIfPresent(currencyTo, forKey: "currencyTo")
        try container.encodeIfPresent(type, forKey: "type")
        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(logoFrom, forKey: "logoFrom")
        try container.encodeIfPresent(logoTo, forKey: "logoTo")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(amount, forKey: "amount")
        try container.encodeIfPresent(amountTo, forKey: "amountTo")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        currencyFrom = try container.decodeIfPresent(CurrencyFrom.self, forKey: "currencyFrom")
        currencyTo = try container.decodeIfPresent(CurrencyTo.self, forKey: "currencyTo")
        type = try container.decodeIfPresent(ModelType.self, forKey: "type")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
        status = try container.decodeIfPresent(Status.self, forKey: "status")
        logoFrom = try container.decodeIfPresent(String.self, forKey: "logoFrom")
        logoTo = try container.decodeIfPresent(String.self, forKey: "logoTo")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
        amountTo = try container.decodeIfPresent(Double.self, forKey: "amountTo")
    }
}
