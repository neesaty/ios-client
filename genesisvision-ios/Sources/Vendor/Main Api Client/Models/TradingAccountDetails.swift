//
// TradingAccountDetails.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class TradingAccountDetails: Codable {

    public enum Currency: String, Codable { 
        case usd = "USD"
        case btc = "BTC"
        case eth = "ETH"
        case usdt = "USDT"
        case gvt = "GVT"
        case undefined = "Undefined"
        case ada = "ADA"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case eur = "EUR"
    }
    public var id: UUID?
    public var currency: Currency?
    public var login: String?
    public var apiKey: String?
    public var asset: AssetDetails?


    
    public init(id: UUID?, currency: Currency?, login: String?, apiKey: String?, asset: AssetDetails?) {
        self.id = id
        self.currency = currency
        self.login = login
        self.apiKey = apiKey
        self.asset = asset
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(login, forKey: "login")
        try container.encodeIfPresent(apiKey, forKey: "apiKey")
        try container.encodeIfPresent(asset, forKey: "asset")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        login = try container.decodeIfPresent(String.self, forKey: "login")
        apiKey = try container.decodeIfPresent(String.self, forKey: "apiKey")
        asset = try container.decodeIfPresent(AssetDetails.self, forKey: "asset")
    }
}

