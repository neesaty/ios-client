//
// TransactionDetails.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class TransactionDetails: Codable {

    public enum ModelType: String, Codable { 
        case investing = "Investing"
        case withdrawal = "Withdrawal"
        case externalWithdrawal = "ExternalWithdrawal"
        case externalDeposit = "ExternalDeposit"
        case converting = "Converting"
        case open = "Open"
        case close = "Close"
        case profit = "Profit"
        case platformFee = "PlatformFee"
    }
    public enum Status: String, Codable { 
        case done = "Done"
        case pending = "Pending"
        case canceled = "Canceled"
        case error = "Error"
    }
    public enum Currency: String, Codable { 
        case btc = "BTC"
        case eth = "ETH"
        case usdt = "USDT"
        case gvt = "GVT"
        case undefined = "Undefined"
        case ada = "ADA"
        case xrp = "XRP"
        case bch = "BCH"
        case ltc = "LTC"
        case doge = "DOGE"
        case bnb = "BNB"
        case usd = "USD"
        case eur = "EUR"
    }
    public var type: ModelType?
    public var programDetails: ProgramTransactionDetails?
    public var convertingDetails: ConvertingDetails?
    public var externalTransactionDetails: ExternalTransactionDetails?
    public var status: Status?
    public var currency: Currency?
    public var currencyName: String?
    public var currencyLogo: String?
    public var gvCommission: Double?
    public var gvCommissionPercent: Double?
    public var amount: Double?


    
    public init(type: ModelType?, programDetails: ProgramTransactionDetails?, convertingDetails: ConvertingDetails?, externalTransactionDetails: ExternalTransactionDetails?, status: Status?, currency: Currency?, currencyName: String?, currencyLogo: String?, gvCommission: Double?, gvCommissionPercent: Double?, amount: Double?) {
        self.type = type
        self.programDetails = programDetails
        self.convertingDetails = convertingDetails
        self.externalTransactionDetails = externalTransactionDetails
        self.status = status
        self.currency = currency
        self.currencyName = currencyName
        self.currencyLogo = currencyLogo
        self.gvCommission = gvCommission
        self.gvCommissionPercent = gvCommissionPercent
        self.amount = amount
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(type, forKey: "type")
        try container.encodeIfPresent(programDetails, forKey: "programDetails")
        try container.encodeIfPresent(convertingDetails, forKey: "convertingDetails")
        try container.encodeIfPresent(externalTransactionDetails, forKey: "externalTransactionDetails")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(currencyName, forKey: "currencyName")
        try container.encodeIfPresent(currencyLogo, forKey: "currencyLogo")
        try container.encodeIfPresent(gvCommission, forKey: "gvCommission")
        try container.encodeIfPresent(gvCommissionPercent, forKey: "gvCommissionPercent")
        try container.encodeIfPresent(amount, forKey: "amount")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        type = try container.decodeIfPresent(ModelType.self, forKey: "type")
        programDetails = try container.decodeIfPresent(ProgramTransactionDetails.self, forKey: "programDetails")
        convertingDetails = try container.decodeIfPresent(ConvertingDetails.self, forKey: "convertingDetails")
        externalTransactionDetails = try container.decodeIfPresent(ExternalTransactionDetails.self, forKey: "externalTransactionDetails")
        status = try container.decodeIfPresent(Status.self, forKey: "status")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        currencyName = try container.decodeIfPresent(String.self, forKey: "currencyName")
        currencyLogo = try container.decodeIfPresent(String.self, forKey: "currencyLogo")
        gvCommission = try container.decodeIfPresent(Double.self, forKey: "gvCommission")
        gvCommissionPercent = try container.decodeIfPresent(Double.self, forKey: "gvCommissionPercent")
        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
    }
}

