//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation

extension TFL.Search {

    
    public enum SearchBusSchedules {

        public static let service = APIService<Response>(id: "Search_BusSchedules", tag: "Search", method: "GET", path: "/Search/BusSchedules", hasBody: false)
        

        public final class Request: APIRequest<Response> {
            
            

            public struct Options {
                

                
                /** The search query */
                
                public var query: String
                

                public init(query: String) {
                    
                    self.query = query
                    
                }
            }

            public var options: Options
            
            

            public init(options: Options) {
                
                
                self.options = options
                
                super.init(service: SearchBusSchedules.service)
            }
            

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(query: String) {
                
                let options = Options(query: query)
                
                self.init(options: options)
            }
            
            
            

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                
                
                params["query"] = options.query
                
                
                return params
            }
            
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            
            
            public typealias SuccessType = SearchResponse
            
            

            /** OK */
            
            
            case status200(SearchResponse)
            
            

            public var success: SearchResponse? {
                switch self {
                
                
                case .status200(let response): return response
                
                
                
                }
            }
            

            public var response: Any {
                switch self {
                
                case .status200(let response): return response
                
                
                }
            }

            public var statusCode: Int {
                switch self {
                
                
                case .status200: return 200
                
                
                }
            }

            public var successful: Bool {
                switch self {
                
                case .status200: return true
                
                }
            }

            public init(statusCode: Int, data: Data) throws {
                
                let decoder = JSONDecoder()
                
                switch statusCode {
                
                
                case 200: self = try .status200(decoder.decode(SearchResponse.self, from: data))
                
                
                
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
