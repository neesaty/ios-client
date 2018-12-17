//
// SearchViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SearchViewModel: Codable {

    public var programs: ProgramsList?
    public var funds: FundsList?
    public var managers: ManagersList?


    
    public init(programs: ProgramsList?, funds: FundsList?, managers: ManagersList?) {
        self.programs = programs
        self.funds = funds
        self.managers = managers
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(programs, forKey: "programs")
        try container.encodeIfPresent(funds, forKey: "funds")
        try container.encodeIfPresent(managers, forKey: "managers")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        programs = try container.decodeIfPresent(ProgramsList.self, forKey: "programs")
        funds = try container.decodeIfPresent(FundsList.self, forKey: "funds")
        managers = try container.decodeIfPresent(ManagersList.self, forKey: "managers")
    }
}

