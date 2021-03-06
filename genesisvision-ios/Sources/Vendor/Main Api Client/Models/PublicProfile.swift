//
// PublicProfile.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class PublicProfile: Codable {

    public var id: UUID?
    public var username: String?
    public var about: String?
    public var avatar: String?
    public var regDate: Date?
    public var assets: [String]?
    public var url: String?
    public var socialLinks: [SocialLinkViewModel]?


    
    public init(id: UUID?, username: String?, about: String?, avatar: String?, regDate: Date?, assets: [String]?, url: String?, socialLinks: [SocialLinkViewModel]?) {
        self.id = id
        self.username = username
        self.about = about
        self.avatar = avatar
        self.regDate = regDate
        self.assets = assets
        self.url = url
        self.socialLinks = socialLinks
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(username, forKey: "username")
        try container.encodeIfPresent(about, forKey: "about")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(regDate, forKey: "regDate")
        try container.encodeIfPresent(assets, forKey: "assets")
        try container.encodeIfPresent(url, forKey: "url")
        try container.encodeIfPresent(socialLinks, forKey: "socialLinks")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        username = try container.decodeIfPresent(String.self, forKey: "username")
        about = try container.decodeIfPresent(String.self, forKey: "about")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        regDate = try container.decodeIfPresent(Date.self, forKey: "regDate")
        assets = try container.decodeIfPresent([String].self, forKey: "assets")
        url = try container.decodeIfPresent(String.self, forKey: "url")
        socialLinks = try container.decodeIfPresent([SocialLinkViewModel].self, forKey: "socialLinks")
    }
}

