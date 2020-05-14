//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class AppConfigPlayback: Codable, Equatable {
    
    

    
    /** How often a heartbeat should be renewed during playback. */
    
    public var heartbeatFrequency: Int
    

    
    /** An array of percentage points in which to fire off plabyack view events.
For example a value of 0.5 would indicate that an event should be
fired when the user is half way through the video.
Often known as quartiles when four equaly spread event points.
 */
    
    public var viewEventPoints: [Double]
    
    
    

    public init(heartbeatFrequency: Int, viewEventPoints: [Double]) {
        
        self.heartbeatFrequency = heartbeatFrequency
        
        self.viewEventPoints = viewEventPoints
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case heartbeatFrequency
        
        case viewEventPoints
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        heartbeatFrequency = try container.decode(.heartbeatFrequency)
        
        viewEventPoints = try container.decodeArray(.viewEventPoints)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encode(heartbeatFrequency, forKey: .heartbeatFrequency)
        
        try container.encode(viewEventPoints, forKey: .viewEventPoints)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? AppConfigPlayback else { return false }
      
      
      
      guard self.heartbeatFrequency == object.heartbeatFrequency else { return false }
      
      
      
      guard self.viewEventPoints == object.viewEventPoints else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: AppConfigPlayback, rhs: AppConfigPlayback) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


