//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//


import Foundation

extension PetstoreTest.User {

    
    public enum CreateUsersWithListInput {

        public static let service = APIService<Response>(id: "createUsersWithListInput", tag: "user", method: "POST", path: "/user/createWithList", hasBody: true)
        

        public final class Request: APIRequest<Response> {
            
            
            

            public var body: [User]
            

            public init(body: [User]) {
                
                self.body = body
                
                
                super.init(service: CreateUsersWithListInput.service) {
                    let jsonEncoder = JSONEncoder()
                    return try jsonEncoder.encode(body)
                }
            }
            
            
            
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            
            
            public typealias SuccessType = Void
            
            

            /** successful operation */
            
            
            case defaultResponse(statusCode: Int)
            
            

            public var success: Void? {
                switch self {
                
                
                default: return nil
                
                }
            }
            

            public var response: Any {
                switch self {
                
                
                default: return ()
                
                }
            }

            public var statusCode: Int {
                switch self {
                
                
                case .defaultResponse(let statusCode): return statusCode
                
                
                }
            }

            public var successful: Bool {
                switch self {
                
                case .defaultResponse: return false
                
                }
            }

            public init(statusCode: Int, data: Data) throws {
                
                switch statusCode {
                
                
                
                default: self = .defaultResponse(statusCode: statusCode)
                
                
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
