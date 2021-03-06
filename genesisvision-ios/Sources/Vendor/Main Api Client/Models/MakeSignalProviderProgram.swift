//
// MakeSignalProviderProgram.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class MakeSignalProviderProgram: Codable {

    public var id: UUID?
    public var periodLength: Int?
    public var stopOutLevel: Double?
    public var investmentLimit: Double?
    public var entryFee: Double?
    public var successFee: Double?


    
    public init(id: UUID?, periodLength: Int?, stopOutLevel: Double?, investmentLimit: Double?, entryFee: Double?, successFee: Double?) {
        self.id = id
        self.periodLength = periodLength
        self.stopOutLevel = stopOutLevel
        self.investmentLimit = investmentLimit
        self.entryFee = entryFee
        self.successFee = successFee
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(periodLength, forKey: "periodLength")
        try container.encodeIfPresent(stopOutLevel, forKey: "stopOutLevel")
        try container.encodeIfPresent(investmentLimit, forKey: "investmentLimit")
        try container.encodeIfPresent(entryFee, forKey: "entryFee")
        try container.encodeIfPresent(successFee, forKey: "successFee")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        periodLength = try container.decodeIfPresent(Int.self, forKey: "periodLength")
        stopOutLevel = try container.decodeIfPresent(Double.self, forKey: "stopOutLevel")
        investmentLimit = try container.decodeIfPresent(Double.self, forKey: "investmentLimit")
        entryFee = try container.decodeIfPresent(Double.self, forKey: "entryFee")
        successFee = try container.decodeIfPresent(Double.self, forKey: "successFee")
    }
}

