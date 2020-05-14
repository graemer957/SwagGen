//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class PostcodeInput: Codable, Equatable {
    
    

    
    public var postcode: String?
    
    
    

    public init(postcode: String? = nil) {
        
        self.postcode = postcode
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case postcode
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        postcode = try container.decodeIfPresent(.postcode)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(postcode, forKey: .postcode)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? PostcodeInput else { return false }
      
      
      
      guard self.postcode == object.postcode else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: PostcodeInput, rhs: PostcodeInput) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


