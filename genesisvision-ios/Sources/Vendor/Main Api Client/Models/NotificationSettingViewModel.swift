//
// NotificationSettingViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class NotificationSettingViewModel: Codable {

    public var id: UUID?
    public var isEnabled: Bool?
    public var assetId: UUID?
    public var managerId: UUID?
    public var type: NotificationType?
    public var conditionType: NotificationSettingConditionType?
    public var conditionAmount: Double?


    
    public init(id: UUID?, isEnabled: Bool?, assetId: UUID?, managerId: UUID?, type: NotificationType?, conditionType: NotificationSettingConditionType?, conditionAmount: Double?) {
        self.id = id
        self.isEnabled = isEnabled
        self.assetId = assetId
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
        try container.encodeIfPresent(assetId, forKey: "assetId")
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
        assetId = try container.decodeIfPresent(UUID.self, forKey: "assetId")
        managerId = try container.decodeIfPresent(UUID.self, forKey: "managerId")
        type = try container.decodeIfPresent(NotificationType.self, forKey: "type")
        conditionType = try container.decodeIfPresent(NotificationSettingConditionType.self, forKey: "conditionType")
        conditionAmount = try container.decodeIfPresent(Double.self, forKey: "conditionAmount")
    }
}

