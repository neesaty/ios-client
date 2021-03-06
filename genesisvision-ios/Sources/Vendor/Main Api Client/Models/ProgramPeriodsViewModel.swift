//
// ProgramPeriodsViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProgramPeriodsViewModel: Codable {

    public var periods: [ProgramPeriodViewModel]?
    public var total: Int?


    
    public init(periods: [ProgramPeriodViewModel]?, total: Int?) {
        self.periods = periods
        self.total = total
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(periods, forKey: "periods")
        try container.encodeIfPresent(total, forKey: "total")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        periods = try container.decodeIfPresent([ProgramPeriodViewModel].self, forKey: "periods")
        total = try container.decodeIfPresent(Int.self, forKey: "total")
    }
}

