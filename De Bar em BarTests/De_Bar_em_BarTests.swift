//
//  De_Bar_em_BarTests.swift
//  De Bar em BarTests
//
//  Created by Jonathan on 29/01/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import XCTest
@testable import De_Bar_em_Bar

class De_Bar_em_BarTests: XCTestCase {
    //MARK: Bar Class Tests
    
    // Confirm that the Bar initializer returns a Bar object when passed valid parameters.
    func testBarInitializationSucceeds() {
        // Zero rating
        let zeroRatingBar = Bar.init(name: "Zero", address: "endereco", phone: "6846", photo: nil, rating: 0, longitude: 0, latitude: 0)
        XCTAssertNotNil(zeroRatingBar)
        
        // Highest positive rating
        let positiveRatingBar = Bar.init(name: "Positive", address: "endereco", phone: "6846", photo: nil, rating: 5, longitude: 0, latitude: 0)
        XCTAssertNotNil(positiveRatingBar)
        
        // Maximum latitude/longitude values
        let maximumCoordinatesValuesBar = Bar.init(name: "Maximum", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 5, longitude: 180, latitude: 90)
        XCTAssertNotNil(maximumCoordinatesValuesBar)
        
        // Minimum latitude/longitude values
        let minimumCoordinatesValuesBar = Bar.init(name: "Minimum", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 5, longitude: -180, latitude: -90)
        XCTAssertNotNil(minimumCoordinatesValuesBar)
    }

    // Confirm that the Bar initialier returns nil when passed a negative rating or an empty name.
    func testBarInitializationFails() {
        // Negative rating
        let negativeRatingBar = Bar.init(name: "Negative", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: -1, longitude: 0, latitude: 0)
        XCTAssertNil(negativeRatingBar)
        
        // Empty String fields
        let emptyNameBar = Bar.init(name: "", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 0, longitude: 0, latitude: 0)
        XCTAssertNil(emptyNameBar)
        
        let emptyAddressBar = Bar.init(name: "NamePlaceholder", address: "", phone: "12345678", photo: nil, rating: 0, longitude: 0, latitude: 0)
        XCTAssertNil(emptyAddressBar)
        
        let emptyPhoneBar = Bar.init(name: "NamePlaceholder", address: "AddressPlaceholder", phone: "", photo: nil, rating: 0, longitude: 0, latitude: 0)
        XCTAssertNil(emptyPhoneBar)
        
        // Rating exceeds maximum
        let largeRatingBar = Bar.init(name: "RatingTooLarge", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 6,  longitude: 0, latitude: 0)
        XCTAssertNil(largeRatingBar)
        
        // Rating exceeds maximum
        let aboveMaximumLatitudeBar = Bar.init(name: "LatitudeTooLarge", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 6,  longitude: 0, latitude: 0)
        XCTAssertNil(aboveMaximumLatitudeBar)
        
        // Rating exceeds maximum
        let belowMinimumLatitudeBar = Bar.init(name: "LatitudeTooSmall", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 6,  longitude: 0, latitude: 0)
        XCTAssertNil(belowMinimumLatitudeBar)
        
        // Rating exceeds maximum
        let aboveMaximumLongitudeBar = Bar.init(name: "LongitudeTooLarge", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 6,  longitude: 0, latitude: 0)
        XCTAssertNil(aboveMaximumLongitudeBar)
        
        // Rating exceeds maximum
        let belowMinimumLongitudeBar = Bar.init(name: "LatitudeTooSmall", address: "AddressPlaceholder", phone: "123456789", photo: nil, rating: 6,  longitude: 0, latitude: 0)
        XCTAssertNil(belowMinimumLongitudeBar)
    }
}
