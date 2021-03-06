//
// FundChartStatistic.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class FundChartStatistic: Codable {

    public var investors: Int?
    public var creationDate: Date?
    public var balance: Double?
    public var profitPercent: Double?
    public var sharpeRatio: Double?
    public var sortinoRatio: Double?
    public var calmarRatio: Double?
    public var maxDrawdown: Double?


    
    public init(investors: Int?, creationDate: Date?, balance: Double?, profitPercent: Double?, sharpeRatio: Double?, sortinoRatio: Double?, calmarRatio: Double?, maxDrawdown: Double?) {
        self.investors = investors
        self.creationDate = creationDate
        self.balance = balance
        self.profitPercent = profitPercent
        self.sharpeRatio = sharpeRatio
        self.sortinoRatio = sortinoRatio
        self.calmarRatio = calmarRatio
        self.maxDrawdown = maxDrawdown
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(investors, forKey: "investors")
        try container.encodeIfPresent(creationDate, forKey: "creationDate")
        try container.encodeIfPresent(balance, forKey: "balance")
        try container.encodeIfPresent(profitPercent, forKey: "profitPercent")
        try container.encodeIfPresent(sharpeRatio, forKey: "sharpeRatio")
        try container.encodeIfPresent(sortinoRatio, forKey: "sortinoRatio")
        try container.encodeIfPresent(calmarRatio, forKey: "calmarRatio")
        try container.encodeIfPresent(maxDrawdown, forKey: "maxDrawdown")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        investors = try container.decodeIfPresent(Int.self, forKey: "investors")
        creationDate = try container.decodeIfPresent(Date.self, forKey: "creationDate")
        balance = try container.decodeIfPresent(Double.self, forKey: "balance")
        profitPercent = try container.decodeIfPresent(Double.self, forKey: "profitPercent")
        sharpeRatio = try container.decodeIfPresent(Double.self, forKey: "sharpeRatio")
        sortinoRatio = try container.decodeIfPresent(Double.self, forKey: "sortinoRatio")
        calmarRatio = try container.decodeIfPresent(Double.self, forKey: "calmarRatio")
        maxDrawdown = try container.decodeIfPresent(Double.self, forKey: "maxDrawdown")
    }
}

