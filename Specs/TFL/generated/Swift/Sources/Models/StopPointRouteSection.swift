//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class StopPointRouteSection: Codable, Equatable {
    
    

    
    public var destinationName: String?
    

    
    public var direction: String?
    

    
    public var isActive: Bool?
    

    
    public var lineId: String?
    

    
    public var lineString: String?
    

    
    public var mode: String?
    

    
    public var naptanId: String?
    

    
    public var routeSectionName: String?
    

    
    public var serviceType: String?
    

    
    public var validFrom: DateTime?
    

    
    public var validTo: DateTime?
    

    
    public var vehicleDestinationText: String?
    
    
    

    public init(destinationName: String? = nil, direction: String? = nil, isActive: Bool? = nil, lineId: String? = nil, lineString: String? = nil, mode: String? = nil, naptanId: String? = nil, routeSectionName: String? = nil, serviceType: String? = nil, validFrom: DateTime? = nil, validTo: DateTime? = nil, vehicleDestinationText: String? = nil) {
        
        self.destinationName = destinationName
        
        self.direction = direction
        
        self.isActive = isActive
        
        self.lineId = lineId
        
        self.lineString = lineString
        
        self.mode = mode
        
        self.naptanId = naptanId
        
        self.routeSectionName = routeSectionName
        
        self.serviceType = serviceType
        
        self.validFrom = validFrom
        
        self.validTo = validTo
        
        self.vehicleDestinationText = vehicleDestinationText
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case destinationName
        
        case direction
        
        case isActive
        
        case lineId
        
        case lineString
        
        case mode
        
        case naptanId
        
        case routeSectionName
        
        case serviceType
        
        case validFrom
        
        case validTo
        
        case vehicleDestinationText
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        destinationName = try container.decodeIfPresent(.destinationName)
        
        direction = try container.decodeIfPresent(.direction)
        
        isActive = try container.decodeIfPresent(.isActive)
        
        lineId = try container.decodeIfPresent(.lineId)
        
        lineString = try container.decodeIfPresent(.lineString)
        
        mode = try container.decodeIfPresent(.mode)
        
        naptanId = try container.decodeIfPresent(.naptanId)
        
        routeSectionName = try container.decodeIfPresent(.routeSectionName)
        
        serviceType = try container.decodeIfPresent(.serviceType)
        
        validFrom = try container.decodeIfPresent(.validFrom)
        
        validTo = try container.decodeIfPresent(.validTo)
        
        vehicleDestinationText = try container.decodeIfPresent(.vehicleDestinationText)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(destinationName, forKey: .destinationName)
        
        try container.encodeIfPresent(direction, forKey: .direction)
        
        try container.encodeIfPresent(isActive, forKey: .isActive)
        
        try container.encodeIfPresent(lineId, forKey: .lineId)
        
        try container.encodeIfPresent(lineString, forKey: .lineString)
        
        try container.encodeIfPresent(mode, forKey: .mode)
        
        try container.encodeIfPresent(naptanId, forKey: .naptanId)
        
        try container.encodeIfPresent(routeSectionName, forKey: .routeSectionName)
        
        try container.encodeIfPresent(serviceType, forKey: .serviceType)
        
        try container.encodeIfPresent(validFrom, forKey: .validFrom)
        
        try container.encodeIfPresent(validTo, forKey: .validTo)
        
        try container.encodeIfPresent(vehicleDestinationText, forKey: .vehicleDestinationText)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? StopPointRouteSection else { return false }
      
      
      
      guard self.destinationName == object.destinationName else { return false }
      
      
      
      guard self.direction == object.direction else { return false }
      
      
      
      guard self.isActive == object.isActive else { return false }
      
      
      
      guard self.lineId == object.lineId else { return false }
      
      
      
      guard self.lineString == object.lineString else { return false }
      
      
      
      guard self.mode == object.mode else { return false }
      
      
      
      guard self.naptanId == object.naptanId else { return false }
      
      
      
      guard self.routeSectionName == object.routeSectionName else { return false }
      
      
      
      guard self.serviceType == object.serviceType else { return false }
      
      
      
      guard self.validFrom == object.validFrom else { return false }
      
      
      
      guard self.validTo == object.validTo else { return false }
      
      
      
      guard self.vehicleDestinationText == object.vehicleDestinationText else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: StopPointRouteSection, rhs: StopPointRouteSection) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


