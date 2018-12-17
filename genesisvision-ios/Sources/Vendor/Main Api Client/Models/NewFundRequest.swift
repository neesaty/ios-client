//
// NewFundRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class NewFundRequest: Codable {

    public var exitFee: Double?
    public var managementFee: Double?
    public var assets: [FundAssetPart]?
    public var title: String?
    public var description: String?
    public var logo: String?
    public var entryFee: Double?


    
    public init(exitFee: Double?, managementFee: Double?, assets: [FundAssetPart]?, title: String?, description: String?, logo: String?, entryFee: Double?) {
        self.exitFee = exitFee
        self.managementFee = managementFee
        self.assets = assets
        self.title = title
        self.description = description
        self.logo = logo
        self.entryFee = entryFee
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(exitFee, forKey: "exitFee")
        try container.encodeIfPresent(managementFee, forKey: "managementFee")
        try container.encodeIfPresent(assets, forKey: "assets")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(entryFee, forKey: "entryFee")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        exitFee = try container.decodeIfPresent(Double.self, forKey: "exitFee")
        managementFee = try container.decodeIfPresent(Double.self, forKey: "managementFee")
        assets = try container.decodeIfPresent([FundAssetPart].self, forKey: "assets")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        description = try container.decodeIfPresent(String.self, forKey: "description")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        entryFee = try container.decodeIfPresent(Double.self, forKey: "entryFee")
    }
}

