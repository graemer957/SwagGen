//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class PaginationAuth: Codable, Equatable {
    
    

    
/** The token type required to load the list. */

public enum `Type`: String, Codable {
    
    case userAccount = "UserAccount"
    
    case userProfile = "UserProfile"
    

    public static let cases: [`Type`] = [
      
      .userAccount,
      
      .userProfile,
      
    ]
}

    
    
    

    
/** The token scope required. */

public enum Scope: String, Codable {
    
    case catalog = "Catalog"
    
    case commerce = "Commerce"
    
    case settings = "Settings"
    

    public static let cases: [Scope] = [
      
      .catalog,
      
      .commerce,
      
      .settings,
      
    ]
}

    
    
    

    
    /** The token type required to load the list. */
    
    public var type: `Type`
    

    
    /** The token scope required. */
    
    public var scope: Scope
    
    
    

    public init(type: `Type`, scope: Scope) {
        
        self.type = type
        
        self.scope = scope
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case type
        
        case scope
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        type = try container.decode(.type)
        
        scope = try container.decode(.scope)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encode(type, forKey: .type)
        
        try container.encode(scope, forKey: .scope)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? PaginationAuth else { return false }
      
      
      
      guard self.type == object.type else { return false }
      
      
      
      guard self.scope == object.scope else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: PaginationAuth, rhs: PaginationAuth) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


