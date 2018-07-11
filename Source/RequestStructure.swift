
import Foundation
import Genome

public class RequestStructure {

    public struct AdditionalAddressDetails: MappableObject {

        public var latitude: String  = ""
        public var longitude: String = ""

        public init() {}
        public init(map: Map) throws { try sequence(map) }

        public mutating func sequence(_ map: Map) throws {

            try latitude  <~> map["latitude"]
            try longitude <~> map["longitude"]
        }
    }

    public struct DeliveryBookingLocation: MappableObject {
        
        public var name: String                                       = ""
        public var phone: String                                      = ""
        public var address: String                                    = ""
        public var additionalAddressDetails: AdditionalAddressDetails? = nil
        
        public init() {}
        public init(map: Map) throws { try sequence(map) }
        
        public mutating func sequence(_ map: Map) throws {
            
            try name                     <~> map["name"]
            try phone                    <~> map["phone"]
            try address                  <~> map["address"]
            try additionalAddressDetails <~> map["additionalAddressDetails"]
        }
    }

    public struct DeliveryBooking: MappableObject {

        public var pickupDetail: DeliveryBookingLocation  = DeliveryBookingLocation()
        public var dropoffDetail: DeliveryBookingLocation = DeliveryBookingLocation()
        
        public init() {}
        public init(map: Map) throws { try sequence(map) }
        
        public mutating func sequence(_ map: Map) throws {

            try pickupDetail  <~> map["pickupDetail"]
            try dropoffDetail <~> map["dropoffDetail"]
        }
    }
    
    public struct CreateOrder: MappableObject {
        
        public var apiKey: String           = ""
        public var booking: DeliveryBooking = DeliveryBooking()
        
        public init() {}
        public init(map: Map) throws { try sequence(map) }
        
        public mutating func sequence(_ map: Map) throws {
            
            try apiKey  <~> map["apiKey"]
            try booking <~> map["booking"]
        }
    }
}
