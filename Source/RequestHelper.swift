
import ALLogger
import Genome
import BoltsSwift
import ALWebAPI
import Alamofire
import ALFunctions

public class RequestHelper: NodeExtractor {
    
    public static func incorrectFormatError(key: String) -> Error {
        
        return GetSwiftNSError(.incorrectAPIResponseFormat(key))
    }
    
    public static func createOrder(_ payload: RequestStructure.CreateOrder) -> Task<ResponseStructure.CreateOrder> {
        
        ALLogger.log.debug("Start")
        
        let payload = try! payload.foundationDictionary()!
        
        let path = ALWebAPI.Path.createOrder
        
        return RequestSender.send(path, requestPayload: payload).continueOnSuccessWithTask {
            
            return Task(try ResponseStructure.CreateOrder(node: $0))
        }
    }
}

