//
// DashboardPortfolio.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class DashboardPortfolio: Codable {

    public var distribution: [MoneyLocation]?


    
    public init(distribution: [MoneyLocation]?) {
        self.distribution = distribution
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(distribution, forKey: "distribution")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        distribution = try container.decodeIfPresent([MoneyLocation].self, forKey: "distribution")
    }
}

