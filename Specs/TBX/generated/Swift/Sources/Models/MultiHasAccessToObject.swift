//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class MultiHasAccessToObject: Codable, Equatable {
    
    

    
    public var granted: [String]
    

    
    public var denied: [String]
    

    
    public var failed: [String]
    

    
    public var details: [HasAccessToObject]
    
    
    

    public init(granted: [String], denied: [String], failed: [String], details: [HasAccessToObject]) {
        
        self.granted = granted
        
        self.denied = denied
        
        self.failed = failed
        
        self.details = details
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case granted
        
        case denied
        
        case failed
        
        case details
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        granted = try container.decodeArray(.granted)
        
        denied = try container.decodeArray(.denied)
        
        failed = try container.decodeArray(.failed)
        
        details = try container.decodeArray(.details)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encode(granted, forKey: .granted)
        
        try container.encode(denied, forKey: .denied)
        
        try container.encode(failed, forKey: .failed)
        
        try container.encode(details, forKey: .details)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? MultiHasAccessToObject else { return false }
      
      
      
      guard self.granted == object.granted else { return false }
      
      
      
      guard self.denied == object.denied else { return false }
      
      
      
      guard self.failed == object.failed else { return false }
      
      
      
      guard self.details == object.details else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: MultiHasAccessToObject, rhs: MultiHasAccessToObject) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


