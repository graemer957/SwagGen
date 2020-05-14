//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class Entitlement: OfferRights {
    
    
    
    

    
    /** The date of activation. If no date is defined the entitlement has not be activated. */
    
    public var activationDate: DateTime?
    

    
    /** The classification of the entitled item. */
    
    public var classification: ClassificationSummary?
    

    
    /** The date the entitlement was created. */
    
    public var creationDate: DateTime?
    

    
    /** The date the entitlement expires. */
    
    public var expirationDate: DateTime?
    

    
    /** The id of the item this entitlement is for. */
    
    public var itemId: String?
    

    
    /** The type of item this entitlement is for. */
    
    public var itemType: ItemType?
    

    
    /** The duration of the entitled media. */
    
    public var mediaDuration: Int?
    

    
    /** How many times the media has been played. */
    
    public var playCount: Int?
    

    
    /** How many more downloads of this media are available. */
    
    public var remainingDownloads: Int?
    
    
    

    public init(deliveryType: DeliveryType, scopes: [String], resolution: Resolution, ownership: Ownership, exclusionRules: [ExclusionRule]? = nil, maxDownloads: Int? = nil, maxPlays: Int? = nil, playPeriod: Int? = nil, rentalPeriod: Int? = nil, activationDate: DateTime? = nil, classification: ClassificationSummary? = nil, creationDate: DateTime? = nil, expirationDate: DateTime? = nil, itemId: String? = nil, itemType: ItemType? = nil, mediaDuration: Int? = nil, playCount: Int? = nil, remainingDownloads: Int? = nil) {
        
        self.activationDate = activationDate
        
        self.classification = classification
        
        self.creationDate = creationDate
        
        self.expirationDate = expirationDate
        
        self.itemId = itemId
        
        self.itemType = itemType
        
        self.mediaDuration = mediaDuration
        
        self.playCount = playCount
        
        self.remainingDownloads = remainingDownloads
        
        
        super.init(deliveryType: deliveryType, scopes: scopes, resolution: resolution, ownership: ownership, exclusionRules: exclusionRules, maxDownloads: maxDownloads, maxPlays: maxPlays, playPeriod: playPeriod, rentalPeriod: rentalPeriod)
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case activationDate
        
        case classification
        
        case creationDate
        
        case expirationDate
        
        case itemId
        
        case itemType
        
        case mediaDuration
        
        case playCount
        
        case remainingDownloads
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        activationDate = try container.decodeIfPresent(.activationDate)
        
        classification = try container.decodeIfPresent(.classification)
        
        creationDate = try container.decodeIfPresent(.creationDate)
        
        expirationDate = try container.decodeIfPresent(.expirationDate)
        
        itemId = try container.decodeIfPresent(.itemId)
        
        itemType = try container.decodeIfPresent(.itemType)
        
        mediaDuration = try container.decodeIfPresent(.mediaDuration)
        
        playCount = try container.decodeIfPresent(.playCount)
        
        remainingDownloads = try container.decodeIfPresent(.remainingDownloads)
        
        
        
        
        try super.init(from: decoder)
        
    }

    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encodeIfPresent(activationDate, forKey: .activationDate)
        
        try container.encodeIfPresent(classification, forKey: .classification)
        
        try container.encodeIfPresent(creationDate, forKey: .creationDate)
        
        try container.encodeIfPresent(expirationDate, forKey: .expirationDate)
        
        try container.encodeIfPresent(itemId, forKey: .itemId)
        
        try container.encodeIfPresent(itemType, forKey: .itemType)
        
        try container.encodeIfPresent(mediaDuration, forKey: .mediaDuration)
        
        try container.encodeIfPresent(playCount, forKey: .playCount)
        
        try container.encodeIfPresent(remainingDownloads, forKey: .remainingDownloads)
        
        
        
        
        try super.encode(to: encoder)
        
    }
    

    override public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? Entitlement else { return false }
      
      
      
      guard self.activationDate == object.activationDate else { return false }
      
      
      
      guard self.classification == object.classification else { return false }
      
      
      
      guard self.creationDate == object.creationDate else { return false }
      
      
      
      guard self.expirationDate == object.expirationDate else { return false }
      
      
      
      guard self.itemId == object.itemId else { return false }
      
      
      
      guard self.itemType == object.itemType else { return false }
      
      
      
      guard self.mediaDuration == object.mediaDuration else { return false }
      
      
      
      guard self.playCount == object.playCount else { return false }
      
      
      
      guard self.remainingDownloads == object.remainingDownloads else { return false }
      
      
      
      
      return super.isEqual(to: object)
      
    }
    
}


