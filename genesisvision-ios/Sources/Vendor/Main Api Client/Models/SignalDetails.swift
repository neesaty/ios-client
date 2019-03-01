//
// SignalDetails.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SignalDetails: Codable {

    public enum Currency: String, Codable { 
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
    public enum Status: String, Codable { 
        case _none = "None"
        case pending = "Pending"
        case errorCreating = "ErrorCreating"
        case active = "Active"
        case closed = "Closed"
        case archived = "Archived"
        case closedDueToInactivity = "ClosedDueToInactivity"
    }
    public var statistic: ProgramDetailsListStatistic?
    public var personalDetails: PersonalSignalDetailsFull?
    public var currency: Currency?
    public var level: Int?
    public var tags: [ProgramTag]?
    public var subscribers: Int?
    public var id: UUID?
    public var logo: String?
    public var url: String?
    public var color: String?
    public var title: String?
    public var description: String?
    public var status: Status?
    public var manager: ProfilePublic?
    public var chart: [ChartSimple]?


    
    public init(statistic: ProgramDetailsListStatistic?, personalDetails: PersonalSignalDetailsFull?, currency: Currency?, level: Int?, tags: [ProgramTag]?, subscribers: Int?, id: UUID?, logo: String?, url: String?, color: String?, title: String?, description: String?, status: Status?, manager: ProfilePublic?, chart: [ChartSimple]?) {
        self.statistic = statistic
        self.personalDetails = personalDetails
        self.currency = currency
        self.level = level
        self.tags = tags
        self.subscribers = subscribers
        self.id = id
        self.logo = logo
        self.url = url
        self.color = color
        self.title = title
        self.description = description
        self.status = status
        self.manager = manager
        self.chart = chart
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(statistic, forKey: "statistic")
        try container.encodeIfPresent(personalDetails, forKey: "personalDetails")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(level, forKey: "level")
        try container.encodeIfPresent(tags, forKey: "tags")
        try container.encodeIfPresent(subscribers, forKey: "subscribers")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(url, forKey: "url")
        try container.encodeIfPresent(color, forKey: "color")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(manager, forKey: "manager")
        try container.encodeIfPresent(chart, forKey: "chart")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        statistic = try container.decodeIfPresent(ProgramDetailsListStatistic.self, forKey: "statistic")
        personalDetails = try container.decodeIfPresent(PersonalSignalDetailsFull.self, forKey: "personalDetails")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        level = try container.decodeIfPresent(Int.self, forKey: "level")
        tags = try container.decodeIfPresent([ProgramTag].self, forKey: "tags")
        subscribers = try container.decodeIfPresent(Int.self, forKey: "subscribers")
        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        url = try container.decodeIfPresent(String.self, forKey: "url")
        color = try container.decodeIfPresent(String.self, forKey: "color")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        status = try container.decodeIfPresent(Status.self, forKey: "status")
        manager = try container.decodeIfPresent(ProfilePublic.self, forKey: "manager")
        chart = try container.decodeIfPresent([ChartSimple].self, forKey: "chart")
    }
}
