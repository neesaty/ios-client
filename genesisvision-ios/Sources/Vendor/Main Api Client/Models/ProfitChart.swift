//
// ProfitChart.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProfitChart: Codable {

    public var chart: [SimpleChartPoint]?
    public var profit: Double?
    public var drawdown: Double?


    
    public init(chart: [SimpleChartPoint]?, profit: Double?, drawdown: Double?) {
        self.chart = chart
        self.profit = profit
        self.drawdown = drawdown
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(chart, forKey: "chart")
        try container.encodeIfPresent(profit, forKey: "profit")
        try container.encodeIfPresent(drawdown, forKey: "drawdown")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        chart = try container.decodeIfPresent([SimpleChartPoint].self, forKey: "chart")
        profit = try container.decodeIfPresent(Double.self, forKey: "profit")
        drawdown = try container.decodeIfPresent(Double.self, forKey: "drawdown")
    }
}
