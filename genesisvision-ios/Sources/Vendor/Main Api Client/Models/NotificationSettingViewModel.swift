//
// NotificationSettingViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class NotificationSettingViewModel: Codable {

    public enum ModelType: String, Codable { 
        case platformNewsAndUpdates = "PlatformNewsAndUpdates"
        case platformEmergency = "PlatformEmergency"
        case platformOther = "PlatformOther"
        case profileUpdated = "ProfileUpdated"
        case profilePwdUpdated = "ProfilePwdUpdated"
        case profileVerification = "ProfileVerification"
        case profile2FA = "Profile2FA"
        case profileSecurity = "ProfileSecurity"
        case programNewsAndUpdates = "ProgramNewsAndUpdates"
        case programEndOfPeriod = "ProgramEndOfPeriod"
        case programCondition = "ProgramCondition"
        case fundNewsAndUpdates = "FundNewsAndUpdates"
        case fundEndOfPeriod = "FundEndOfPeriod"
        case fundRebalancing = "FundRebalancing"
        case managerNewProgram = "ManagerNewProgram"
    }
    public enum ConditionType: String, Codable { 
        case empty = "Empty"
        case profit = "Profit"
        case level = "Level"
    }
    public var id: UUID?
    public var isEnabled: Bool?
    public var programId: UUID?
    public var managerId: UUID?
    public var type: ModelType?
    public var conditionType: ConditionType?
    public var conditionAmount: Double?


    
    public init(id: UUID?, isEnabled: Bool?, programId: UUID?, managerId: UUID?, type: ModelType?, conditionType: ConditionType?, conditionAmount: Double?) {
        self.id = id
        self.isEnabled = isEnabled
        self.programId = programId
        self.managerId = managerId
        self.type = type
        self.conditionType = conditionType
        self.conditionAmount = conditionAmount
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(isEnabled, forKey: "isEnabled")
        try container.encodeIfPresent(programId, forKey: "programId")
        try container.encodeIfPresent(managerId, forKey: "managerId")
        try container.encodeIfPresent(type, forKey: "type")
        try container.encodeIfPresent(conditionType, forKey: "conditionType")
        try container.encodeIfPresent(conditionAmount, forKey: "conditionAmount")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        isEnabled = try container.decodeIfPresent(Bool.self, forKey: "isEnabled")
        programId = try container.decodeIfPresent(UUID.self, forKey: "programId")
        managerId = try container.decodeIfPresent(UUID.self, forKey: "managerId")
        type = try container.decodeIfPresent(ModelType.self, forKey: "type")
        conditionType = try container.decodeIfPresent(ConditionType.self, forKey: "conditionType")
        conditionAmount = try container.decodeIfPresent(Double.self, forKey: "conditionAmount")
    }
}

