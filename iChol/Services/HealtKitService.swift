//
//  HealtKitService.swift
//  iChol
//
//  Created by Windy on 04/11/20.
//

import Foundation
import HealthKit

class HealthKitService {
    
    private let healthStore = HKHealthStore()
    
    static let shared = HealthKitService()
    
     func authorization() {
        let HealthKitTypesToRead : Set <HKObjectType> = [
            HKQuantityType.quantityType(forIdentifier: .dietaryFatSaturated)!,
            HKQuantityType.quantityType(forIdentifier: .dietarySugar)!,
            HKQuantityType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
        ]
        let healthKitTypesToWrite : Set<HKSampleType> = [
            HKQuantityType.quantityType(forIdentifier: .dietaryFatSaturated)!,
            HKQuantityType.quantityType(forIdentifier: .dietarySugar)!,
            HKQuantityType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
        ]
        if !HKHealthStore.isHealthDataAvailable() {
            print("Error occured")
            return
        }
        
        healthStore.requestAuthorization(toShare: healthKitTypesToWrite, read: HealthKitTypesToRead){ (success, error) in
            if !success {
                print("error")
            } else {
                print("Success")
                
            }
        }
        healthStore.requestAuthorization(toShare: healthKitTypesToWrite, read: HealthKitTypesToRead){ (success, error) in
            if !success {
                print("error")
            } else {
                print("Success")
                
            }
        }
    }
    
}
