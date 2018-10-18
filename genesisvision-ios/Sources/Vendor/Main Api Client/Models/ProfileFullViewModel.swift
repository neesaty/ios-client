//
// ProfileFullViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProfileFullViewModel: Codable {

    public enum VerificationStatus: String, Codable { 
        case notVerified = "NotVerified"
        case verified = "Verified"
        case underReview = "UnderReview"
        case rejected = "Rejected"
    }
    public var id: UUID?
    public var email: String?
    public var firstName: String?
    public var middleName: String?
    public var lastName: String?
    public var country: String?
    public var city: String?
    public var address: String?
    public var phone: String?
    public var phoneNumberConfirmed: Bool?
    public var birthday: Date?
    public var gender: Bool?
    public var avatar: String?
    public var about: String?
    public var userName: String?
    public var index: String?
    public var citizenship: String?
    public var verificationStatus: VerificationStatus?


    
    public init(id: UUID?, email: String?, firstName: String?, middleName: String?, lastName: String?, country: String?, city: String?, address: String?, phone: String?, phoneNumberConfirmed: Bool?, birthday: Date?, gender: Bool?, avatar: String?, about: String?, userName: String?, index: String?, citizenship: String?, verificationStatus: VerificationStatus?) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.country = country
        self.city = city
        self.address = address
        self.phone = phone
        self.phoneNumberConfirmed = phoneNumberConfirmed
        self.birthday = birthday
        self.gender = gender
        self.avatar = avatar
        self.about = about
        self.userName = userName
        self.index = index
        self.citizenship = citizenship
        self.verificationStatus = verificationStatus
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(firstName, forKey: "firstName")
        try container.encodeIfPresent(middleName, forKey: "middleName")
        try container.encodeIfPresent(lastName, forKey: "lastName")
        try container.encodeIfPresent(country, forKey: "country")
        try container.encodeIfPresent(city, forKey: "city")
        try container.encodeIfPresent(address, forKey: "address")
        try container.encodeIfPresent(phone, forKey: "phone")
        try container.encodeIfPresent(phoneNumberConfirmed, forKey: "phoneNumberConfirmed")
        try container.encodeIfPresent(birthday, forKey: "birthday")
        try container.encodeIfPresent(gender, forKey: "gender")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(about, forKey: "about")
        try container.encodeIfPresent(userName, forKey: "userName")
        try container.encodeIfPresent(index, forKey: "index")
        try container.encodeIfPresent(citizenship, forKey: "citizenship")
        try container.encodeIfPresent(verificationStatus, forKey: "verificationStatus")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        email = try container.decodeIfPresent(String.self, forKey: "email")
        firstName = try container.decodeIfPresent(String.self, forKey: "firstName")
        middleName = try container.decodeIfPresent(String.self, forKey: "middleName")
        lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
        country = try container.decodeIfPresent(String.self, forKey: "country")
        city = try container.decodeIfPresent(String.self, forKey: "city")
        address = try container.decodeIfPresent(String.self, forKey: "address")
        phone = try container.decodeIfPresent(String.self, forKey: "phone")
        phoneNumberConfirmed = try container.decodeIfPresent(Bool.self, forKey: "phoneNumberConfirmed")
        birthday = try container.decodeIfPresent(Date.self, forKey: "birthday")
        gender = try container.decodeIfPresent(Bool.self, forKey: "gender")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        about = try container.decodeIfPresent(String.self, forKey: "about")
        userName = try container.decodeIfPresent(String.self, forKey: "userName")
        index = try container.decodeIfPresent(String.self, forKey: "index")
        citizenship = try container.decodeIfPresent(String.self, forKey: "citizenship")
        verificationStatus = try container.decodeIfPresent(VerificationStatus.self, forKey: "verificationStatus")
    }
}

