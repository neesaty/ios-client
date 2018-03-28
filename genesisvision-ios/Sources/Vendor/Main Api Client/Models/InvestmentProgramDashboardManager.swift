//
// InvestmentProgramDashboardManager.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class InvestmentProgramDashboardManager: Codable {

    public enum Currency: String, Codable { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case usd = "USD"
        case eur = "EUR"
    }
    public var id: UUID?
    public var title: String?
    public var description: String?
    public var level: Int?
    public var logo: String?
    public var balance: Double?
    public var currency: Currency?
    public var tradesCount: Int?
    public var periodDuration: Int?
    public var investorsCount: Int?
    public var isEnabled: Bool?
    public var startOfPeriod: Date?
    public var profitTotal: Double?
    public var profitTotalGvt: Double?
    public var profitCurrent: Double?


    
    public init(id: UUID?, title: String?, description: String?, level: Int?, logo: String?, balance: Double?, currency: Currency?, tradesCount: Int?, periodDuration: Int?, investorsCount: Int?, isEnabled: Bool?, startOfPeriod: Date?, profitTotal: Double?, profitTotalGvt: Double?, profitCurrent: Double?) {
        self.id = id
        self.title = title
        self.description = description
        self.level = level
        self.logo = logo
        self.balance = balance
        self.currency = currency
        self.tradesCount = tradesCount
        self.periodDuration = periodDuration
        self.investorsCount = investorsCount
        self.isEnabled = isEnabled
        self.startOfPeriod = startOfPeriod
        self.profitTotal = profitTotal
        self.profitTotalGvt = profitTotalGvt
        self.profitCurrent = profitCurrent
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(level, forKey: "level")
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(balance, forKey: "balance")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(tradesCount, forKey: "tradesCount")
        try container.encodeIfPresent(periodDuration, forKey: "periodDuration")
        try container.encodeIfPresent(investorsCount, forKey: "investorsCount")
        try container.encodeIfPresent(isEnabled, forKey: "isEnabled")
        try container.encodeIfPresent(startOfPeriod, forKey: "startOfPeriod")
        try container.encodeIfPresent(profitTotal, forKey: "profitTotal")
        try container.encodeIfPresent(profitTotalGvt, forKey: "profitTotalGvt")
        try container.encodeIfPresent(profitCurrent, forKey: "profitCurrent")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        level = try container.decodeIfPresent(Int.self, forKey: "level")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        balance = try container.decodeIfPresent(Double.self, forKey: "balance")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        tradesCount = try container.decodeIfPresent(Int.self, forKey: "tradesCount")
        periodDuration = try container.decodeIfPresent(Int.self, forKey: "periodDuration")
        investorsCount = try container.decodeIfPresent(Int.self, forKey: "investorsCount")
        isEnabled = try container.decodeIfPresent(Bool.self, forKey: "isEnabled")
        startOfPeriod = try container.decodeIfPresent(Date.self, forKey: "startOfPeriod")
        profitTotal = try container.decodeIfPresent(Double.self, forKey: "profitTotal")
        profitTotalGvt = try container.decodeIfPresent(Double.self, forKey: "profitTotalGvt")
        profitCurrent = try container.decodeIfPresent(Double.self, forKey: "profitCurrent")
    }
}

