//
// OpenOrderModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class OpenOrderModel: Codable {

    public enum Direction: String, Codable { 
        case buy = "Buy"
        case sell = "Sell"
        case balance = "Balance"
        case credit = "Credit"
        case undefined = "Undefined"
    }
    public var id: UUID?
    public var ticket: Int64?
    public var symbol: String?
    public var volume: Double?
    public var price: Double?
    public var profit: Double?
    public var direction: Direction?
    public var date: Date?


    
    public init(id: UUID?, ticket: Int64?, symbol: String?, volume: Double?, price: Double?, profit: Double?, direction: Direction?, date: Date?) {
        self.id = id
        self.ticket = ticket
        self.symbol = symbol
        self.volume = volume
        self.price = price
        self.profit = profit
        self.direction = direction
        self.date = date
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(ticket, forKey: "ticket")
        try container.encodeIfPresent(symbol, forKey: "symbol")
        try container.encodeIfPresent(volume, forKey: "volume")
        try container.encodeIfPresent(price, forKey: "price")
        try container.encodeIfPresent(profit, forKey: "profit")
        try container.encodeIfPresent(direction, forKey: "direction")
        try container.encodeIfPresent(date, forKey: "date")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        ticket = try container.decodeIfPresent(Int64.self, forKey: "ticket")
        symbol = try container.decodeIfPresent(String.self, forKey: "symbol")
        volume = try container.decodeIfPresent(Double.self, forKey: "volume")
        price = try container.decodeIfPresent(Double.self, forKey: "price")
        profit = try container.decodeIfPresent(Double.self, forKey: "profit")
        direction = try container.decodeIfPresent(Direction.self, forKey: "direction")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
    }
}
