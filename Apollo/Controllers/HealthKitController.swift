//
//  HealthKitController.swift
//  Apollo
//
//  Created by Nikola Grujic on 10/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitController
{
    private static let store = HKHealthStore();
    private static var weight: Double = 0.0;
    
    internal class func requestAuthorization(identifier: HKQuantityTypeIdentifier) -> Void
    {
        if !self.isHealthDataAvailable()
        {
            print("Health data not available");
            return;
        }

        let quantityType = HKQuantityType.quantityType(forIdentifier: identifier)!;
        let workoutType = HKObjectType.workoutType();

        self.store.requestAuthorization(toShare: [], read: [quantityType, workoutType], completion:
        {
            (isSuccess, error) in
                if isSuccess
                {
                    print("Authorized \(identifier)");
                }
                else
                {
                    print("Not authorized \(identifier)");
                }
        });
    }
    
    internal class func getSample(for sampleType: HKSampleType,
                                  startDate: Date,
                                  endDate: Date,
                                  completion: @escaping ([HKSample]?, Error?) -> Swift.Void)
    {
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: startDate,
                                                              end: endDate,
                                                              options: .strictEndDate);

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                              ascending: false);

        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: [sortDescriptor])
        {
            (query, samples, error) in
                DispatchQueue.main.async
                {
                    guard let samples = samples
                    else
                    {
                        completion(nil, error);
                        return;
                    }

                    completion(samples, nil);
                }
        }

        self.store.execute(sampleQuery);
    }
    
    private class func isHealthDataAvailable() -> Bool
    {
        return HKHealthStore.isHealthDataAvailable();
    }
    
    internal class func fetchWeight()
    {
        guard let bodyMassSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass)
        else
        {
            print("Body Mass Sample Type is no longer available in HealthKit");
            return;
        }

        let startDate = Date.init(timeIntervalSinceNow: -7*24*60*60); // Last week
        let endDate = Date(); // Now
        
        self.getSample(for: bodyMassSampleType,
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
                        self.weight = quantitySample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo));
                    }
                }
        }
    }
    
    internal class func getWeight() -> Double
    {
        return self.weight;
    }
}
