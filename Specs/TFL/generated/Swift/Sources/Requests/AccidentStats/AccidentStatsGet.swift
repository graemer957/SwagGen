//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation

extension TFL.AccidentStats {

    
    public enum AccidentStatsGet {

        public static let service = APIService<Response>(id: "AccidentStats_Get", tag: "AccidentStats", method: "GET", path: "/AccidentStats/{year}", hasBody: false)
        

        public final class Request: APIRequest<Response> {
            
            

            public struct Options {
                

                
                /** The year for which to filter the accidents on. */
                
                public var year: Int
                

                public init(year: Int) {
                    
                    self.year = year
                    
                }
            }

            public var options: Options
            
            

            public init(options: Options) {
                
                
                self.options = options
                
                super.init(service: AccidentStatsGet.service)
            }
            

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(year: Int) {
                
                let options = Options(year: year)
                
                self.init(options: options)
            }
            
            

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "year" + "}", with: "\(self.options.year)")
            }
            
            
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            
            
            public typealias SuccessType = [AccidentDetail]
            
            

            /** OK */
            
            
            case status200([AccidentDetail])
            
            

            public var success: [AccidentDetail]? {
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
                
                
                case 200: self = try .status200(decoder.decode([AccidentDetail].self, from: data))
                
                
                
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
