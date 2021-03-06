//
// ProgramCreateAssetPlatformInfo.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProgramCreateAssetPlatformInfo: Codable {

    public var maxEntryFee: Double?
    public var maxSuccessFee: Double?


    
    public init(maxEntryFee: Double?, maxSuccessFee: Double?) {
        self.maxEntryFee = maxEntryFee
        self.maxSuccessFee = maxSuccessFee
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(maxEntryFee, forKey: "maxEntryFee")
        try container.encodeIfPresent(maxSuccessFee, forKey: "maxSuccessFee")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        maxEntryFee = try container.decodeIfPresent(Double.self, forKey: "maxEntryFee")
        maxSuccessFee = try container.decodeIfPresent(Double.self, forKey: "maxSuccessFee")
    }
}

