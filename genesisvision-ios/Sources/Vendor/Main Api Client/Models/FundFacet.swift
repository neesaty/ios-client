//
// FundFacet.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class FundFacet: Codable {

    public enum Sorting: String, Codable { 
        case byProfitAsc = "ByProfitAsc"
        case byProfitDesc = "ByProfitDesc"
        case byDrawdownAsc = "ByDrawdownAsc"
        case byDrawdownDesc = "ByDrawdownDesc"
        case byInvestorsAsc = "ByInvestorsAsc"
        case byInvestorsDesc = "ByInvestorsDesc"
        case byNewAsc = "ByNewAsc"
        case byNewDesc = "ByNewDesc"
        case byTitleAsc = "ByTitleAsc"
        case byTitleDesc = "ByTitleDesc"
        case byBalanceAsc = "ByBalanceAsc"
        case byBalanceDesc = "ByBalanceDesc"
    }
    public enum SortType: String, Codable { 
        case new = "New"
        case top = "Top"
        case weeklyTop = "WeeklyTop"
        case popular = "Popular"
        case toLevelUp = "ToLevelUp"
    }
    public enum Timeframe: String, Codable { 
        case day = "Day"
        case week = "Week"
        case month = "Month"
        case threeMonths = "ThreeMonths"
        case year = "Year"
        case allTime = "AllTime"
    }
    public var sorting: Sorting?
    public var id: UUID?
    public var title: String?
    public var description: String?
    public var logo: String?
    public var url: String?
    public var sortType: SortType?
    public var timeframe: Timeframe?


    
    public init(sorting: Sorting?, id: UUID?, title: String?, description: String?, logo: String?, url: String?, sortType: SortType?, timeframe: Timeframe?) {
        self.sorting = sorting
        self.id = id
        self.title = title
        self.description = description
        self.logo = logo
        self.url = url
        self.sortType = sortType
        self.timeframe = timeframe
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(sorting, forKey: "sorting")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(url, forKey: "url")
        try container.encodeIfPresent(sortType, forKey: "sortType")
        try container.encodeIfPresent(timeframe, forKey: "timeframe")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        sorting = try container.decodeIfPresent(Sorting.self, forKey: "sorting")
        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        url = try container.decodeIfPresent(String.self, forKey: "url")
        sortType = try container.decodeIfPresent(SortType.self, forKey: "sortType")
        timeframe = try container.decodeIfPresent(Timeframe.self, forKey: "timeframe")
    }
}
