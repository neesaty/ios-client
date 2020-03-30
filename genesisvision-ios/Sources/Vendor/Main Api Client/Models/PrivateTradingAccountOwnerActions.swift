//
// PrivateTradingAccountOwnerActions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class PrivateTradingAccountOwnerActions: Codable {

    public var canClose: Bool?
    public var canChangePassword: Bool?
    public var canTransferMoney: Bool?
    public var canMakeDemoDeposit: Bool?
    public var canMakeProgramFromPrivateTradingAccount: Bool?
    public var canMakeSignalProviderFromPrivateTradingAccount: Bool?
    public var canMakeSignalProviderFromPrivateExternalTradingAccount: Bool?
    public var canMakeProgramFromSignalProvider: Bool?
    public var canMakeSignalProviderFromProgram: Bool?
    public var canEditSignalProviderSettings: Bool?
    public var isEnoughMoneyToCreateProgram: Bool?
    public var canConfirm2FA: Bool?


    
    public init(canClose: Bool?, canChangePassword: Bool?, canTransferMoney: Bool?, canMakeDemoDeposit: Bool?, canMakeProgramFromPrivateTradingAccount: Bool?, canMakeSignalProviderFromPrivateTradingAccount: Bool?, canMakeSignalProviderFromPrivateExternalTradingAccount: Bool?, canMakeProgramFromSignalProvider: Bool?, canMakeSignalProviderFromProgram: Bool?, canEditSignalProviderSettings: Bool?, isEnoughMoneyToCreateProgram: Bool?, canConfirm2FA: Bool?) {
        self.canClose = canClose
        self.canChangePassword = canChangePassword
        self.canTransferMoney = canTransferMoney
        self.canMakeDemoDeposit = canMakeDemoDeposit
        self.canMakeProgramFromPrivateTradingAccount = canMakeProgramFromPrivateTradingAccount
        self.canMakeSignalProviderFromPrivateTradingAccount = canMakeSignalProviderFromPrivateTradingAccount
        self.canMakeSignalProviderFromPrivateExternalTradingAccount = canMakeSignalProviderFromPrivateExternalTradingAccount
        self.canMakeProgramFromSignalProvider = canMakeProgramFromSignalProvider
        self.canMakeSignalProviderFromProgram = canMakeSignalProviderFromProgram
        self.canEditSignalProviderSettings = canEditSignalProviderSettings
        self.isEnoughMoneyToCreateProgram = isEnoughMoneyToCreateProgram
        self.canConfirm2FA = canConfirm2FA
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(canClose, forKey: "canClose")
        try container.encodeIfPresent(canChangePassword, forKey: "canChangePassword")
        try container.encodeIfPresent(canTransferMoney, forKey: "canTransferMoney")
        try container.encodeIfPresent(canMakeDemoDeposit, forKey: "canMakeDemoDeposit")
        try container.encodeIfPresent(canMakeProgramFromPrivateTradingAccount, forKey: "canMakeProgramFromPrivateTradingAccount")
        try container.encodeIfPresent(canMakeSignalProviderFromPrivateTradingAccount, forKey: "canMakeSignalProviderFromPrivateTradingAccount")
        try container.encodeIfPresent(canMakeSignalProviderFromPrivateExternalTradingAccount, forKey: "canMakeSignalProviderFromPrivateExternalTradingAccount")
        try container.encodeIfPresent(canMakeProgramFromSignalProvider, forKey: "canMakeProgramFromSignalProvider")
        try container.encodeIfPresent(canMakeSignalProviderFromProgram, forKey: "canMakeSignalProviderFromProgram")
        try container.encodeIfPresent(canEditSignalProviderSettings, forKey: "canEditSignalProviderSettings")
        try container.encodeIfPresent(isEnoughMoneyToCreateProgram, forKey: "isEnoughMoneyToCreateProgram")
        try container.encodeIfPresent(canConfirm2FA, forKey: "canConfirm2FA")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        canClose = try container.decodeIfPresent(Bool.self, forKey: "canClose")
        canChangePassword = try container.decodeIfPresent(Bool.self, forKey: "canChangePassword")
        canTransferMoney = try container.decodeIfPresent(Bool.self, forKey: "canTransferMoney")
        canMakeDemoDeposit = try container.decodeIfPresent(Bool.self, forKey: "canMakeDemoDeposit")
        canMakeProgramFromPrivateTradingAccount = try container.decodeIfPresent(Bool.self, forKey: "canMakeProgramFromPrivateTradingAccount")
        canMakeSignalProviderFromPrivateTradingAccount = try container.decodeIfPresent(Bool.self, forKey: "canMakeSignalProviderFromPrivateTradingAccount")
        canMakeSignalProviderFromPrivateExternalTradingAccount = try container.decodeIfPresent(Bool.self, forKey: "canMakeSignalProviderFromPrivateExternalTradingAccount")
        canMakeProgramFromSignalProvider = try container.decodeIfPresent(Bool.self, forKey: "canMakeProgramFromSignalProvider")
        canMakeSignalProviderFromProgram = try container.decodeIfPresent(Bool.self, forKey: "canMakeSignalProviderFromProgram")
        canEditSignalProviderSettings = try container.decodeIfPresent(Bool.self, forKey: "canEditSignalProviderSettings")
        isEnoughMoneyToCreateProgram = try container.decodeIfPresent(Bool.self, forKey: "isEnoughMoneyToCreateProgram")
        canConfirm2FA = try container.decodeIfPresent(Bool.self, forKey: "canConfirm2FA")
    }
}
