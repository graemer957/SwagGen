//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class TwentyFourHourClockTime: Codable, Equatable {
    
    

    
    public var hour: String?
    

    
    public var minute: String?
    
    
    

    public init(hour: String? = nil, minute: String? = nil) {
        
        self.hour = hour
        
        self.minute = minute
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case hour
        
        case minute
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        hour = try container.decodeIfPresent(.hour)
        
        minute = try container.decodeIfPresent(.minute)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(hour, forKey: .hour)
        
        try container.encodeIfPresent(minute, forKey: .minute)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? TwentyFourHourClockTime else { return false }
      
      
      
      guard self.hour == object.hour else { return false }
      
      
      
      guard self.minute == object.minute else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: TwentyFourHourClockTime, rhs: TwentyFourHourClockTime) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


