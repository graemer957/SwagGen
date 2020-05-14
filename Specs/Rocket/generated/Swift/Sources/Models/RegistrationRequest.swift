//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class RegistrationRequest: Codable, Equatable {
    
    

    
    public var email: String
    

    
    public var password: String
    

    
    public var firstName: String?
    

    
    public var lastName: String?
    

    
    /** Whether to receive marketing material or not. Default to true. */
    
    public var marketing: Bool?
    

    
    /** The primary account pin. */
    
    public var pin: String?
    

    
    /** The segments to apply to the primary profile. */
    
    public var segments: [String]?
    
    
    

    public init(email: String, password: String, firstName: String? = nil, lastName: String? = nil, marketing: Bool? = nil, pin: String? = nil, segments: [String]? = nil) {
        
        self.email = email
        
        self.password = password
        
        self.firstName = firstName
        
        self.lastName = lastName
        
        self.marketing = marketing
        
        self.pin = pin
        
        self.segments = segments
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case email
        
        case password
        
        case firstName
        
        case lastName
        
        case marketing
        
        case pin
        
        case segments
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        email = try container.decode(.email)
        
        password = try container.decode(.password)
        
        firstName = try container.decodeIfPresent(.firstName)
        
        lastName = try container.decodeIfPresent(.lastName)
        
        marketing = try container.decodeIfPresent(.marketing)
        
        pin = try container.decodeIfPresent(.pin)
        
        segments = try container.decodeArrayIfPresent(.segments)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encode(email, forKey: .email)
        
        try container.encode(password, forKey: .password)
        
        try container.encodeIfPresent(firstName, forKey: .firstName)
        
        try container.encodeIfPresent(lastName, forKey: .lastName)
        
        try container.encodeIfPresent(marketing, forKey: .marketing)
        
        try container.encodeIfPresent(pin, forKey: .pin)
        
        try container.encodeIfPresent(segments, forKey: .segments)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? RegistrationRequest else { return false }
      
      
      
      guard self.email == object.email else { return false }
      
      
      
      guard self.password == object.password else { return false }
      
      
      
      guard self.firstName == object.firstName else { return false }
      
      
      
      guard self.lastName == object.lastName else { return false }
      
      
      
      guard self.marketing == object.marketing else { return false }
      
      
      
      guard self.pin == object.pin else { return false }
      
      
      
      guard self.segments == object.segments else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: RegistrationRequest, rhs: RegistrationRequest) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


