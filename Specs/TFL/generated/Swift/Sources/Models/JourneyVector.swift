//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class JourneyVector: Codable, Equatable {
    
    

    
    public var from: String?
    

    
    public var to: String?
    

    
    public var uri: String?
    

    
    public var via: String?
    
    
    

    public init(from: String? = nil, to: String? = nil, uri: String? = nil, via: String? = nil) {
        
        self.from = from
        
        self.to = to
        
        self.uri = uri
        
        self.via = via
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case from
        
        case to
        
        case uri
        
        case via
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        from = try container.decodeIfPresent(.from)
        
        to = try container.decodeIfPresent(.to)
        
        uri = try container.decodeIfPresent(.uri)
        
        via = try container.decodeIfPresent(.via)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(from, forKey: .from)
        
        try container.encodeIfPresent(to, forKey: .to)
        
        try container.encodeIfPresent(uri, forKey: .uri)
        
        try container.encodeIfPresent(via, forKey: .via)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? JourneyVector else { return false }
      
      
      
      guard self.from == object.from else { return false }
      
      
      
      guard self.to == object.to else { return false }
      
      
      
      guard self.uri == object.uri else { return false }
      
      
      
      guard self.via == object.via else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: JourneyVector, rhs: JourneyVector) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


