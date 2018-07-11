import Localize_Swift

public enum GetSwiftErrors {
    
    case otherError(String, String?)
    case incorrectAPIResponseFormat(String)
    
    fileprivate var userInfo: [String:Any] {
        
        let description: String
        let reason: String
        
        switch self {
            
        case .otherError (let erroDescription, let errorReason):
            description = erroDescription
            reason      = errorReason ?? ""
            
        case .incorrectAPIResponseFormat (let string):
            description = "incorrect_response_format".localized() + " (expecting: \(string))"
            reason = ""
        }
        
        return [NSLocalizedDescriptionKey:description, NSLocalizedFailureReasonErrorKey:reason]
    }
}

public class GetSwiftNSError: NSError {
    
    public init (_ error: GetSwiftErrors) {
        
        super.init(domain: "com.foodics.ios.ALGetSwift", code: 260, userInfo: error.userInfo)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
