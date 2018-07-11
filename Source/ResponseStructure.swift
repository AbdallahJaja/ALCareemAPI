
import Genome

public class ResponseStructure {

    public struct DeliveryDetails: MappableObject {

        public var reference: String = ""
        
        init() {}
        public init(map: Map) throws { try sequence(map) }
        
        public mutating func sequence(_ map: Map) throws {

            try reference <~> map["reference"]
        }
    }

    public struct CreateOrder: MappableObject {

        public var delivery: DeliveryDetails = DeliveryDetails()
        
        init() {}
        public init(map: Map) throws { try sequence(map) }
        
        public mutating func sequence(_ map: Map) throws {

            try delivery <~> map["delivery"]
        }
    }
}
