//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class Category: Codable, Equatable {
    
    

    
    public var id: Int?
    

    
    public var name: String?
    
    
    

    public init(id: Int? = nil, name: String? = nil) {
        
        self.id = id
        
        self.name = name
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case id
        
        case name
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        id = try container.decodeIfPresent(.id)
        
        name = try container.decodeIfPresent(.name)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(id, forKey: .id)
        
        try container.encodeIfPresent(name, forKey: .name)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? Category else { return false }
      
      
      
      guard self.id == object.id else { return false }
      
      
      
      guard self.name == object.name else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


