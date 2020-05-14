//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation



public class MediaFile: Codable, Equatable {
    
    

    
/** The way in which the media file is delivered. */

public enum DeliveryType: String, Codable {
    
    case stream = "Stream"
    
    case progressive = "Progressive"
    
    case download = "Download"
    

    public static let cases: [DeliveryType] = [
      
      .stream,
      
      .progressive,
      
      .download,
      
    ]
}

    
    
    

    
/** The resolution of the video media. */

public enum Resolution: String, Codable {
    
    case sd = "SD"
    
    case hd720 = "HD-720"
    
    case hd1080 = "HD-1080"
    
    case unknown = "Unknown"
    

    public static let cases: [Resolution] = [
      
      .sd,
      
      .hd720,
      
      .hd1080,
      
      .unknown,
      
    ]
}

    
    
    

    
    /** The name of the media file. */
    
    public var name: String
    

    
    /** The way in which the media file is delivered. */
    
    public var deliveryType: DeliveryType
    

    
    /** The url to access the media file. */
    
    public var url: URL
    

    
    /** The type of drm used to encrypt the media. 'None' if unencrypted. */
    
    public var drm: String
    

    
    /** The format the media was encoded in. */
    
    public var format: String
    

    
    /** The resolution of the video media. */
    
    public var resolution: Resolution
    

    
    /** The width of the video media. */
    
    public var width: Int
    

    
    /** The height of the video media. */
    
    public var height: Int
    

    
    /** The language code for the media, e.g. 'en'. */
    
    public var language: String
    

    
    /** The number of audio channels. */
    
    public var channels: Int?
    
    
    

    public init(name: String, deliveryType: DeliveryType, url: URL, drm: String, format: String, resolution: Resolution, width: Int, height: Int, language: String, channels: Int? = nil) {
        
        self.name = name
        
        self.deliveryType = deliveryType
        
        self.url = url
        
        self.drm = drm
        
        self.format = format
        
        self.resolution = resolution
        
        self.width = width
        
        self.height = height
        
        self.language = language
        
        self.channels = channels
        
        
    }

    
    private enum CodingKeys: String, CodingKey {
        
        case name
        
        case deliveryType
        
        case url
        
        case drm
        
        case format
        
        case resolution
        
        case width
        
        case height
        
        case language
        
        case channels
        
    }
    

    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        name = try container.decode(.name)
        
        deliveryType = try container.decode(.deliveryType)
        
        url = try container.decode(.url)
        
        drm = try container.decode(.drm)
        
        format = try container.decode(.format)
        
        resolution = try container.decode(.resolution)
        
        width = try container.decode(.width)
        
        height = try container.decode(.height)
        
        language = try container.decode(.language)
        
        channels = try container.decodeIfPresent(.channels)
        
        
        
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        try container.encode(name, forKey: .name)
        
        try container.encode(deliveryType, forKey: .deliveryType)
        
        try container.encode(url, forKey: .url)
        
        try container.encode(drm, forKey: .drm)
        
        try container.encode(format, forKey: .format)
        
        try container.encode(resolution, forKey: .resolution)
        
        try container.encode(width, forKey: .width)
        
        try container.encode(height, forKey: .height)
        
        try container.encode(language, forKey: .language)
        
        try container.encodeIfPresent(channels, forKey: .channels)
        
        
        
        
    }
    

    public func isEqual(to object: Any?) -> Bool {
      
      guard let object = object as? MediaFile else { return false }
      
      
      
      guard self.name == object.name else { return false }
      
      
      
      guard self.deliveryType == object.deliveryType else { return false }
      
      
      
      guard self.url == object.url else { return false }
      
      
      
      guard self.drm == object.drm else { return false }
      
      
      
      guard self.format == object.format else { return false }
      
      
      
      guard self.resolution == object.resolution else { return false }
      
      
      
      guard self.width == object.width else { return false }
      
      
      
      guard self.height == object.height else { return false }
      
      
      
      guard self.language == object.language else { return false }
      
      
      
      guard self.channels == object.channels else { return false }
      
      
      
      
      return true
      
    }
    

    public static func == (lhs: MediaFile, rhs: MediaFile) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
}


