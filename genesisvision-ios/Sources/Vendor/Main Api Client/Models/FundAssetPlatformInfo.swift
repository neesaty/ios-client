//
// FundAssetPlatformInfo.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class FundAssetPlatformInfo: Codable {

    public var facets: [AssetFacet]?
    public var assets: [PlatformAsset]?
    public var minInvestAmountIntoFund: [AmountWithCurrency]?
    public var createFundInfo: FundCreateAssetPlatformInfo?


    
    public init(facets: [AssetFacet]?, assets: [PlatformAsset]?, minInvestAmountIntoFund: [AmountWithCurrency]?, createFundInfo: FundCreateAssetPlatformInfo?) {
        self.facets = facets
        self.assets = assets
        self.minInvestAmountIntoFund = minInvestAmountIntoFund
        self.createFundInfo = createFundInfo
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(facets, forKey: "facets")
        try container.encodeIfPresent(assets, forKey: "assets")
        try container.encodeIfPresent(minInvestAmountIntoFund, forKey: "minInvestAmountIntoFund")
        try container.encodeIfPresent(createFundInfo, forKey: "createFundInfo")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        facets = try container.decodeIfPresent([AssetFacet].self, forKey: "facets")
        assets = try container.decodeIfPresent([PlatformAsset].self, forKey: "assets")
        minInvestAmountIntoFund = try container.decodeIfPresent([AmountWithCurrency].self, forKey: "minInvestAmountIntoFund")
        createFundInfo = try container.decodeIfPresent(FundCreateAssetPlatformInfo.self, forKey: "createFundInfo")
    }
}
