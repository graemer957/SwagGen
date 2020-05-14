//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class InstructionStep: Codable, Equatable {
    
    

    
public enum SkyDirectionDescription: String, Codable {
    
    case north = "North"
    
    case northEast = "NorthEast"
    
    case east = "East"
    
    case southEast = "SouthEast"
    
    case south = "South"
    
    case southWest = "SouthWest"
    
    case west = "West"
    
    case northWest = "NorthWest"
    

    public static let cases: [SkyDirectionDescription] = [
      
      .north,
      
      .northEast,
      
      .east,
      
      .southEast,
      
      .south,
      
      .southWest,
      
      .west,
      
      .northWest,
      
    ]
}

    
    
    

    
public enum TrackType: String, Codable {
    
    case cycleSuperHighway = "CycleSuperHighway"
    
    case canalTowpath = "CanalTowpath"
    
    case quietRoad = "QuietRoad"
    
    case provisionForCyclists = "ProvisionForCyclists"
    
    case busyRoads = "BusyRoads"
    
    case none = "None"
    
    case pushBike = "PushBike"
    

    public static let cases: [TrackType] = [
      
      .cycleSuperHighway,
      
      .canalTowpath,
      
      .quietRoad,
      
      .provisionForCyclists,
      
      .busyRoads,
      
      .none,
      
      .pushBike,
      
    ]
}

    
    
    

    
    public var cumulativeDistance: Int?
    

    
    public var cumulativeTravelTime: Int?
    

    
    public var description: String?
    

    
    public var descriptionHeading: String?
    

    
    public var distance: Int?
    

    
    public var latitude: Double?
    

    
    public var longitude: Double?
    

    
    public var pathAttribute: PathAttribute?
    

    
    public var skyDirection: Int?
    

    
    public var skyDirectionDescription: SkyDirectionDescription?
    

    
    public var streetName: String?
    

    
    public var trackType: TrackType?
    

    
    public var turnDirection: String?
    
    
    

    public init(cumulativeDistance: Int? = nil, cumulativeTravelTime: Int? = nil, description: String? = nil, descriptionHeading: String? = nil, distance: Int? = nil, latitude: Double? = nil, longitude: Double? = nil, pathAttribute: PathAttribute? = nil, skyDirection: Int? = nil, skyDirectionDescription: SkyDirectionDescription? = nil, streetName: String? = nil, trackType: TrackType? = nil, turnDirection: String? = nil) {
        
        self.cumulativeDistance = cumulativeDistance
        
        self.cumulativeTravelTime = cumulativeTravelTime
        
        self.description = description
        
        self.descriptionHeading = descriptionHeading
        
        self.distance = distance
        
        self.latitude = latitude
        
        self.longitude = longitude
        
        self.pathAttribute = pathAttribute
        
        self.skyDirection = skyDirection
        
        self.skyDirectionDescription = skyDirectionDescription
        
        self.streetName = streetName
        
        self.trackType = trackType
        
        self.turnDirection = turnDirection
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case cumulativeDistance
        
        case cumulativeTravelTime
        
        case description
        
        case descriptionHeading
        
        case distance
        
        case latitude
        
        case longitude
        
        case pathAttribute
        
        case skyDirection
        
        case skyDirectionDescription
        
        case streetName
        
        case trackType
        
        case turnDirection
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        cumulativeDistance = try container.decodeIfPresent(.cumulativeDistance)
        
        cumulativeTravelTime = try container.decodeIfPresent(.cumulativeTravelTime)
        
        description = try container.decodeIfPresent(.description)
        
        descriptionHeading = try container.decodeIfPresent(.descriptionHeading)
        
        distance = try container.decodeIfPresent(.distance)
        
        latitude = try container.decodeIfPresent(.latitude)
        
        longitude = try container.decodeIfPresent(.longitude)
        
        pathAttribute = try container.decodeIfPresent(.pathAttribute)
        
        skyDirection = try container.decodeIfPresent(.skyDirection)
        
        skyDirectionDescription = try container.decodeIfPresent(.skyDirectionDescription)
        
        streetName = try container.decodeIfPresent(.streetName)
        
        trackType = try container.decodeIfPresent(.trackType)
        
        turnDirection = try container.decodeIfPresent(.turnDirection)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(cumulativeDistance, forKey: .cumulativeDistance)
        
        try container.encodeIfPresent(cumulativeTravelTime, forKey: .cumulativeTravelTime)
        
        try container.encodeIfPresent(description, forKey: .description)
        
        try container.encodeIfPresent(descriptionHeading, forKey: .descriptionHeading)
        
        try container.encodeIfPresent(distance, forKey: .distance)
        
        try container.encodeIfPresent(latitude, forKey: .latitude)
        
        try container.encodeIfPresent(longitude, forKey: .longitude)
        
        try container.encodeIfPresent(pathAttribute, forKey: .pathAttribute)
        
        try container.encodeIfPresent(skyDirection, forKey: .skyDirection)
        
        try container.encodeIfPresent(skyDirectionDescription, forKey: .skyDirectionDescription)
        
        try container.encodeIfPresent(streetName, forKey: .streetName)
        
        try container.encodeIfPresent(trackType, forKey: .trackType)
        
        try container.encodeIfPresent(turnDirection, forKey: .turnDirection)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? InstructionStep else { return false }
      
      
      
      guard self.cumulativeDistance == object.cumulativeDistance else { return false }
      
      
      
      guard self.cumulativeTravelTime == object.cumulativeTravelTime else { return false }
      
      
      
      guard self.description == object.description else { return false }
      
      
      
      guard self.descriptionHeading == object.descriptionHeading else { return false }
      
      
      
      guard self.distance == object.distance else { return false }
      
      
      
      guard self.latitude == object.latitude else { return false }
      
      
      
      guard self.longitude == object.longitude else { return false }
      
      
      
      guard self.pathAttribute == object.pathAttribute else { return false }
      
      
      
      guard self.skyDirection == object.skyDirection else { return false }
      
      
      
      guard self.skyDirectionDescription == object.skyDirectionDescription else { return false }
      
      
      
      guard self.streetName == object.streetName else { return false }
      
      
      
      guard self.trackType == object.trackType else { return false }
      
      
      
      guard self.turnDirection == object.turnDirection else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: InstructionStep, rhs: InstructionStep) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


