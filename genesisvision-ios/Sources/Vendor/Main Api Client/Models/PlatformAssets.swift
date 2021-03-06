//
// PlatformAssets.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class PlatformAssets: Codable {

    public var assets: [PlatformAsset]?


    
    public init(assets: [PlatformAsset]?) {
        self.assets = assets
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(assets, forKey: "assets")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        assets = try container.decodeIfPresent([PlatformAsset].self, forKey: "assets")
    }
}

