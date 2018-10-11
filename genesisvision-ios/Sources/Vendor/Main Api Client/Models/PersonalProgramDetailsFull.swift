//
// PersonalProgramDetailsFull.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class PersonalProgramDetailsFull: Codable {

    public enum Status: String, Codable { 
        case active = "Active"
        case investing = "Investing"
        case withdrawing = "Withdrawing"
        case ended = "Ended"
    }
    public var isReinvest: Bool?
    public var isFavorite: Bool?
    public var isInvested: Bool?
    public var isOwnProgram: Bool?
    public var value: Double?
    public var profit: Double?
    public var status: Status?


    
    public init(isReinvest: Bool?, isFavorite: Bool?, isInvested: Bool?, isOwnProgram: Bool?, value: Double?, profit: Double?, status: Status?) {
        self.isReinvest = isReinvest
        self.isFavorite = isFavorite
        self.isInvested = isInvested
        self.isOwnProgram = isOwnProgram
        self.value = value
        self.profit = profit
        self.status = status
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(isReinvest, forKey: "isReinvest")
        try container.encodeIfPresent(isFavorite, forKey: "isFavorite")
        try container.encodeIfPresent(isInvested, forKey: "isInvested")
        try container.encodeIfPresent(isOwnProgram, forKey: "isOwnProgram")
        try container.encodeIfPresent(value, forKey: "value")
        try container.encodeIfPresent(profit, forKey: "profit")
        try container.encodeIfPresent(status, forKey: "status")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        isReinvest = try container.decodeIfPresent(Bool.self, forKey: "isReinvest")
        isFavorite = try container.decodeIfPresent(Bool.self, forKey: "isFavorite")
        isInvested = try container.decodeIfPresent(Bool.self, forKey: "isInvested")
        isOwnProgram = try container.decodeIfPresent(Bool.self, forKey: "isOwnProgram")
        value = try container.decodeIfPresent(Double.self, forKey: "value")
        profit = try container.decodeIfPresent(Double.self, forKey: "profit")
        status = try container.decodeIfPresent(Status.self, forKey: "status")
    }
}

