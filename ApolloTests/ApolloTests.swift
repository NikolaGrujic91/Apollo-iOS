//
//  ApolloTests.swift
//  ApolloTests
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import XCTest
@testable import Apollo
import HealthKit

class ApolloTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecoding() throws
    {
        if let path = Bundle.main.path(forResource: "data", ofType: "json")
        {
            let jsonString = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8);
            let jsonData = jsonString.data(using: .utf8)!;
            XCTAssertNoThrow(try JSONDecoder().decode(Array<Plan>.self, from: jsonData))
        }
        else
        {
            XCTAssert(false, "data.json is not part of main bundle.");
        }
    }
    
    func testPlansLoading() throws
    {
        let planStore = PlanStore();
        XCTAssertEqual(planStore.plans.count, 6, "Number of loaded plans is wrong");
    }
    
    func testEncoding() throws
    {
        let planStore = PlanStore();
        XCTAssertNoThrow(try? JSONEncoder().encode(planStore.plans));
    }
    
    func testWeightLoading() throws
    {
        let weightStore = WeightStore();
        XCTAssertGreaterThan(weightStore.weight.value, 0.0, "Loaded weight is wrong");
    }
    
    func testWeightEncoding() throws
    {
        let weightStore = WeightStore();
        XCTAssertNoThrow(try? JSONEncoder().encode(weightStore.weight));
    }
    
    func testSoundAvailable() throws
    {
        let fileManager = FileManager();
        
        if let path: String = Bundle.main.path(forResource: "WorkoutCountdown_Haptic", ofType: "caf")
        {
            XCTAssertEqual(fileManager.fileExists(atPath: path), true, "WorkoutCountdown_Haptic.caf does not exist");
        }
        else
        {
            XCTAssert(false, "WorkoutCountdown_Haptic.caf is not part of main bundle.");
        }

        
        if let path = Bundle.main.path(forResource: "WorkoutComplete_Haptic", ofType: "caf")
        {
            XCTAssertEqual(fileManager.fileExists(atPath: path), true, "WorkoutComplete_Haptic.caf does not exist");
        }
        else
        {
            XCTAssert(false, "WorkoutComplete_Haptic.caf is not part of main bundle.");
        }
    }
    
    func testHealthDataAvailable() throws
    {
        XCTAssertEqual(HKHealthStore.isHealthDataAvailable(), true, "Health Data not available");
    }
    
    func testGetWeightHealthKit() throws
    {
        guard let bodyMassSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass)
        else
        {
            print("Body Mass Sample Type is no longer available in HealthKit");
            return;
        }

        let startDate = Date.init(timeIntervalSinceNow: -7*24*60*60); // Last week
        let endDate = Date(); // Now
        
        HealthKitController.getSample(for: bodyMassSampleType,
                                      startDate: startDate,
                                      endDate: endDate)
        {
            (samples, error) in
                guard let samples = samples
                else
                {
                    if let error = error
                    {
                        print(error);
                    }

                    return;
                }
              
                for sample in samples
                {
                    if let quantitySample = sample as? HKQuantitySample
                    {
                        let weight = quantitySample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo));
                        
                        XCTAssertGreaterThan(weight, 0);
                    }
                }
        }
    }
}
