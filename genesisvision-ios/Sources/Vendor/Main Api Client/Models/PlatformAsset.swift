//
// PlatformAsset.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class PlatformAsset: Codable {

    public var id: UUID?
    public var name: String?
    public var asset: String?
    public var description: String?
    public var icon: String?
    public var color: String?
    public var mandatoryFundPercent: Double?
    public var url: String?


    
    public init(id: UUID?, name: String?, asset: String?, description: String?, icon: String?, color: String?, mandatoryFundPercent: Double?, url: String?) {
        self.id = id
        self.name = name
        self.asset = asset
        self.description = description
        self.icon = icon
        self.color = color
        self.mandatoryFundPercent = mandatoryFundPercent
        self.url = url
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(asset, forKey: "asset")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(icon, forKey: "icon")
        try container.encodeIfPresent(color, forKey: "color")
        try container.encodeIfPresent(mandatoryFundPercent, forKey: "mandatoryFundPercent")
        try container.encodeIfPresent(url, forKey: "url")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        asset = try container.decodeIfPresent(String.self, forKey: "asset")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        icon = try container.decodeIfPresent(String.self, forKey: "icon")
        color = try container.decodeIfPresent(String.self, forKey: "color")
        mandatoryFundPercent = try container.decodeIfPresent(Double.self, forKey: "mandatoryFundPercent")
        url = try container.decodeIfPresent(String.self, forKey: "url")
    }
}

