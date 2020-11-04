//
//  ProgressContainerView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import HealthKit

class ProgressContainerView: UIView {
    
    var fatProgress: ProgressBarView!
    var sugarProgress: ProgressBarView!
    var calorieProgress: CircularProgressView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchCalorie()
        fetchSatFat()
        fetchSugar()
        backgroundColor = Color.background
        layer.cornerRadius = 16
        backgroundColor = .white
        
        let divider = UIView()
        divider.backgroundColor = Color.grey
        addSubview(divider)
        
        fatProgress = ProgressBarView()
        fatProgress.configureView(label: "Saturated", left: 0, progress: 0)
        addSubview(fatProgress)
        
        sugarProgress = ProgressBarView()
        sugarProgress.configureView(label: "Sugar", left: 0, progress: 0)
        addSubview(sugarProgress)
        
        calorieProgress = CircularProgressView()
        addSubview(calorieProgress)
        
        divider.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 24,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -24,
            centerXAnchor: centerXAnchor,
            widthAnchorConstant: 1)
        
        fatProgress.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 24,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
        
        sugarProgress.setConstraint(
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -24,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
        
        calorieProgress.setConstraint(
            trailingAnchor: divider.trailingAnchor, trailingAnchorConstant: -90,
            centerYAnchor: centerYAnchor)
    }
    
    func fetchCalorie() {
        
        guard let energyType = HKSampleType.quantityType(forIdentifier: .dietaryEnergyConsumed) else { return }
        let start = Calendar.current.date(byAdding: .day, value: -1, to: .distantPast)!
        let last24hPredicate = HKQuery.predicateForSamples(withStart: start, end: Date(), options: .strictEndDate)
        
        let energyQuery = HKSampleQuery(sampleType: energyType,
                                        predicate: last24hPredicate,
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: nil) {
            (query, sample, error) in
            
            guard error == nil,
                  let quantitySamples = sample as? [HKQuantitySample] else { return }
            
            let total = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.calorie()) }
            let cal = 2000 - Int(total)
            let prog = total / 2000
            print("Total kcal: \(Int(cal))")
            print(prog)
            self.calorieProgress.configureView(howMuchLeft: Int(cal), progress: CGFloat(Double(prog)))
            //                                               DispatchQueue.main.async {
            //                                                   print(String(format: "Energy: %.2f", total))
            //                                               }
        }
        HKHealthStore().execute(energyQuery)
    }
    
    func fetchSatFat() {
        
        guard let energyType = HKSampleType.quantityType(forIdentifier: .dietaryFatSaturated) else {
            print("Sample type not available")
            return
        }
        
        let last24hPredicate = HKQuery.predicateForSamples(withStart: Date().startDate(of: Date()), end: Date(), options: .strictEndDate)
        
        let energyQuery = HKSampleQuery(sampleType: energyType,
                                        predicate: last24hPredicate,
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: nil) {
            (query, sample, error) in
            
            guard
                error == nil,
                let quantitySamples = sample as? [HKQuantitySample] else { return }
            
            let total = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.gram()) }
            let cal = 22.2 - total
            let prog = cal / 22.2
            print("Total Saturated Fat: \(prog)")
            
            self.fatProgress.configureView(label: "Saturated Fat", left: Int(cal), progress: CGFloat(Double(prog)))
            
            
        }
        HKHealthStore().execute(energyQuery)
    }
    func fetchSugar() {
        
        guard let energyType = HKSampleType.quantityType(forIdentifier: .dietarySugar) else {
            print("Sample type not available")
            return
        }
        let start = Calendar.current.date(byAdding: .day, value: -1, to: .distantPast)!
        let last24hPredicate = HKQuery.predicateForSamples(withStart: start, end: Date(), options: .strictEndDate)
        
        let energyQuery = HKSampleQuery(sampleType: energyType,
                                        predicate: last24hPredicate,
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: nil) {
            (query, sample, error) in
            
            guard error == nil,
                  let quantitySamples = sample as? [HKQuantitySample] else { return }
            
            let total = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.gram()) }
            let cal = 25 - total
            let prog = cal / 25
            print("Total Saturated Fat: \(prog)")
            
            self.sugarProgress.configureView(label: "Sugar Fat", left: Int(cal), progress: CGFloat(Double(prog)))
        }
        
        HKHealthStore().execute(energyQuery)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
