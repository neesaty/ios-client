//
// ProgramTag.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProgramTag: Codable {

    public var name: String?
    public var color: String?


    
    public init(name: String?, color: String?) {
        self.name = name
        self.color = color
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(color, forKey: "color")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        name = try container.decodeIfPresent(String.self, forKey: "name")
        color = try container.decodeIfPresent(String.self, forKey: "color")
    }
}

