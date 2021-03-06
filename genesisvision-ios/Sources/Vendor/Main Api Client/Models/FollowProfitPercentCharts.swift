//
// FollowProfitPercentCharts.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class FollowProfitPercentCharts: Codable {

    public var statistic: FollowChartStatistic?
    public var charts: [SimpleChart]?


    
    public init(statistic: FollowChartStatistic?, charts: [SimpleChart]?) {
        self.statistic = statistic
        self.charts = charts
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(statistic, forKey: "statistic")
        try container.encodeIfPresent(charts, forKey: "charts")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        statistic = try container.decodeIfPresent(FollowChartStatistic.self, forKey: "statistic")
        charts = try container.decodeIfPresent([SimpleChart].self, forKey: "charts")
    }
}

