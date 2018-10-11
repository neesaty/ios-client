//
// DashboardPortfolioEvent.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class DashboardPortfolioEvent: Codable {

    public enum ModelType: String, Codable { 
        case all = "All"
        case invest = "Invest"
        case withdraw = "Withdraw"
        case profit = "Profit"
        case loss = "Loss"
        case reinvest = "Reinvest"
        case cancelled = "Cancelled"
        case ended = "Ended"
    }
    public var assetId: UUID?
    public var date: Date?
    public var title: String?
    public var value: Double?
    public var type: ModelType?
    public var logo: String?


    
    public init(assetId: UUID?, date: Date?, title: String?, value: Double?, type: ModelType?, logo: String?) {
        self.assetId = assetId
        self.date = date
        self.title = title
        self.value = value
        self.type = type
        self.logo = logo
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(assetId, forKey: "assetId")
        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(value, forKey: "value")
        try container.encodeIfPresent(type, forKey: "type")
        try container.encodeIfPresent(logo, forKey: "logo")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        assetId = try container.decodeIfPresent(UUID.self, forKey: "assetId")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        value = try container.decodeIfPresent(Double.self, forKey: "value")
        type = try container.decodeIfPresent(ModelType.self, forKey: "type")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
    }
}

