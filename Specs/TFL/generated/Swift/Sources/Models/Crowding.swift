//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class Crowding: Codable, Equatable {
    
    

    
    /** Busiest times at a station (static information) */
    
    public var passengerFlows: [PassengerFlow]?
    

    
    /** Train Loading on a scale 1-6, 1 being "Very quiet" and 6 being "Exceptionally busy" (static information) */
    
    public var trainLoadings: [TrainLoading]?
    
    
    

    public init(passengerFlows: [PassengerFlow]? = nil, trainLoadings: [TrainLoading]? = nil) {
        
        self.passengerFlows = passengerFlows
        
        self.trainLoadings = trainLoadings
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case passengerFlows
        
        case trainLoadings
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        passengerFlows = try container.decodeArrayIfPresent(.passengerFlows)
        
        trainLoadings = try container.decodeArrayIfPresent(.trainLoadings)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(passengerFlows, forKey: .passengerFlows)
        
        try container.encodeIfPresent(trainLoadings, forKey: .trainLoadings)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? Crowding else { return false }
      
      
      
      guard self.passengerFlows == object.passengerFlows else { return false }
      
      
      
      guard self.trainLoadings == object.trainLoadings else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: Crowding, rhs: Crowding) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


