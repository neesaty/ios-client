//
// DashboardChartAssets.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class DashboardChartAssets: Codable {

    public var assets: [DashboardChartAsset]?


    
    public init(assets: [DashboardChartAsset]?) {
        self.assets = assets
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(assets, forKey: "assets")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        assets = try container.decodeIfPresent([DashboardChartAsset].self, forKey: "assets")
    }
}
