//
// FundWithdrawInfo.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class FundWithdrawInfo: Codable {

    public var exitFee: Double?
    public var title: String?
    public var availableToWithdraw: Double?
    public var rate: Double?


    
    public init(exitFee: Double?, title: String?, availableToWithdraw: Double?, rate: Double?) {
        self.exitFee = exitFee
        self.title = title
        self.availableToWithdraw = availableToWithdraw
        self.rate = rate
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(exitFee, forKey: "exitFee")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(availableToWithdraw, forKey: "availableToWithdraw")
        try container.encodeIfPresent(rate, forKey: "rate")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        exitFee = try container.decodeIfPresent(Double.self, forKey: "exitFee")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        availableToWithdraw = try container.decodeIfPresent(Double.self, forKey: "availableToWithdraw")
        rate = try container.decodeIfPresent(Double.self, forKey: "rate")
    }
}

