//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class dollarspecialmodelName: Codable, Equatable {
    
    

    
    public var dollarspecialpropertyName: Int?
    
    
    

    public init(dollarspecialpropertyName: Int? = nil) {
        
        self.dollarspecialpropertyName = dollarspecialpropertyName
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case dollarspecialpropertyName = "$special[property.name]"
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        dollarspecialpropertyName = try container.decodeIfPresent(.dollarspecialpropertyName)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(dollarspecialpropertyName, forKey: .dollarspecialpropertyName)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? dollarspecialmodelName else { return false }
      
      
      
      guard self.dollarspecialpropertyName == object.dollarspecialpropertyName else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: dollarspecialmodelName, rhs: dollarspecialmodelName) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


