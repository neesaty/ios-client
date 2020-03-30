//
// OrderSignalModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class OrderSignalModel: Codable {

    public var providers: [OrderSignalProgramInfo]?
    public var totalCommission: Double?
    public var totalCommissionByType: [FeeDetails]?
    public var tradingAccountId: UUID?
    public var currency: Currency?
    public var id: UUID?
    public var login: String?
    public var ticket: String?
    public var symbol: String?
    public var volume: Double?
    public var profit: Double?
    public var profitCurrency: String?
    public var direction: TradeDirectionType?
    public var date: Date?
    public var price: Double?
    public var priceCurrent: Double?
    public var entry: TradeEntryType?
    /** Volume in account currency. Only filled when trade have zero commission (for paying fees with GVT) */
    public var baseVolume: Double?
    /** Huobi: sell - quote currency (right), buy - base symbol currency (left) */
    public var originalCommission: Double?
    public var originalCommissionCurrency: String?
    /** In account currency */
    public var commission: Double?
    public var swap: Double?
    public var showOriginalCommission: Bool?
    /** For signals */
    public var signalData: OrderModelSignalData?


    
    public init(providers: [OrderSignalProgramInfo]?, totalCommission: Double?, totalCommissionByType: [FeeDetails]?, tradingAccountId: UUID?, currency: Currency?, id: UUID?, login: String?, ticket: String?, symbol: String?, volume: Double?, profit: Double?, profitCurrency: String?, direction: TradeDirectionType?, date: Date?, price: Double?, priceCurrent: Double?, entry: TradeEntryType?, baseVolume: Double?, originalCommission: Double?, originalCommissionCurrency: String?, commission: Double?, swap: Double?, showOriginalCommission: Bool?, signalData: OrderModelSignalData?) {
        self.providers = providers
        self.totalCommission = totalCommission
        self.totalCommissionByType = totalCommissionByType
        self.tradingAccountId = tradingAccountId
        self.currency = currency
        self.id = id
        self.login = login
        self.ticket = ticket
        self.symbol = symbol
        self.volume = volume
        self.profit = profit
        self.profitCurrency = profitCurrency
        self.direction = direction
        self.date = date
        self.price = price
        self.priceCurrent = priceCurrent
        self.entry = entry
        self.baseVolume = baseVolume
        self.originalCommission = originalCommission
        self.originalCommissionCurrency = originalCommissionCurrency
        self.commission = commission
        self.swap = swap
        self.showOriginalCommission = showOriginalCommission
        self.signalData = signalData
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(providers, forKey: "providers")
        try container.encodeIfPresent(totalCommission, forKey: "totalCommission")
        try container.encodeIfPresent(totalCommissionByType, forKey: "totalCommissionByType")
        try container.encodeIfPresent(tradingAccountId, forKey: "tradingAccountId")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(login, forKey: "login")
        try container.encodeIfPresent(ticket, forKey: "ticket")
        try container.encodeIfPresent(symbol, forKey: "symbol")
        try container.encodeIfPresent(volume, forKey: "volume")
        try container.encodeIfPresent(profit, forKey: "profit")
        try container.encodeIfPresent(profitCurrency, forKey: "profitCurrency")
        try container.encodeIfPresent(direction, forKey: "direction")
        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(price, forKey: "price")
        try container.encodeIfPresent(priceCurrent, forKey: "priceCurrent")
        try container.encodeIfPresent(entry, forKey: "entry")
        try container.encodeIfPresent(baseVolume, forKey: "baseVolume")
        try container.encodeIfPresent(originalCommission, forKey: "originalCommission")
        try container.encodeIfPresent(originalCommissionCurrency, forKey: "originalCommissionCurrency")
        try container.encodeIfPresent(commission, forKey: "commission")
        try container.encodeIfPresent(swap, forKey: "swap")
        try container.encodeIfPresent(showOriginalCommission, forKey: "showOriginalCommission")
        try container.encodeIfPresent(signalData, forKey: "signalData")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        providers = try container.decodeIfPresent([OrderSignalProgramInfo].self, forKey: "providers")
        totalCommission = try container.decodeIfPresent(Double.self, forKey: "totalCommission")
        totalCommissionByType = try container.decodeIfPresent([FeeDetails].self, forKey: "totalCommissionByType")
        tradingAccountId = try container.decodeIfPresent(UUID.self, forKey: "tradingAccountId")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        login = try container.decodeIfPresent(String.self, forKey: "login")
        ticket = try container.decodeIfPresent(String.self, forKey: "ticket")
        symbol = try container.decodeIfPresent(String.self, forKey: "symbol")
        volume = try container.decodeIfPresent(Double.self, forKey: "volume")
        profit = try container.decodeIfPresent(Double.self, forKey: "profit")
        profitCurrency = try container.decodeIfPresent(String.self, forKey: "profitCurrency")
        direction = try container.decodeIfPresent(TradeDirectionType.self, forKey: "direction")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
        price = try container.decodeIfPresent(Double.self, forKey: "price")
        priceCurrent = try container.decodeIfPresent(Double.self, forKey: "priceCurrent")
        entry = try container.decodeIfPresent(TradeEntryType.self, forKey: "entry")
        baseVolume = try container.decodeIfPresent(Double.self, forKey: "baseVolume")
        originalCommission = try container.decodeIfPresent(Double.self, forKey: "originalCommission")
        originalCommissionCurrency = try container.decodeIfPresent(String.self, forKey: "originalCommissionCurrency")
        commission = try container.decodeIfPresent(Double.self, forKey: "commission")
        swap = try container.decodeIfPresent(Double.self, forKey: "swap")
        showOriginalCommission = try container.decodeIfPresent(Bool.self, forKey: "showOriginalCommission")
        signalData = try container.decodeIfPresent(OrderModelSignalData.self, forKey: "signalData")
    }
}
