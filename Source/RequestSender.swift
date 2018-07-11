
import Alamofire
import ALWebAPI
import Genome
import BoltsSwift

public extension ALWebAPI.Path {
    public static let createOrder = ALWebAPI.Path(URL: "/api/v2/deliveries", method: .post, title: "Create New Order Task")
}

public class RequestSender {
    
    fileprivate static let baseURL = "https://app.getswift.co"
    
    fileprivate static let webAPI: ALWebAPI = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest  = 60
        configuration.timeoutIntervalForResource = 60
        
        let manager = SessionManager(configuration: configuration)
        
        let webAPI = ALWebAPI(manager: manager)
        webAPI.setRequestHeader("Accept", value: "application/json")
        webAPI.setRequestHeader("Content-Type", value: "application/json")
        
        return webAPI
    }()
    
    public static func send(_ path: ALWebAPI.Path, requestPayload: ALWebAPI.RequestPayloadType? = nil, encoding: ParameterEncoding = JSONEncoding.default) -> Task<Node> {
        
        return webAPI.requestWithMethod(path.method, requestURL: baseURL + path.URL, requestPayload: requestPayload, encoding: encoding, title: path.title).continueOnSuccessWith { (data, statusCode) -> Node in
            
            let json: Node
            do {
                json = try data.makeNode()
            } catch {
                json = EmptyNode
            }
            
            switch statusCode {
                
                case 200:
                    return json
                case 400:
                    throw GetSwiftNSError(.otherError(json["error"]?.string ?? "unknown_error", String(data: data, encoding: .utf8)))
                case 401:
                    throw GetSwiftNSError(.otherError(json["error"]?.string ?? "unknown_error", String(data: data, encoding: .utf8)))
                default:
                    throw GetSwiftNSError(.otherError("Please Try Again Later. Error# \(statusCode)", String(data: data, encoding: .utf8)))
            }
        }
    }
    
}
