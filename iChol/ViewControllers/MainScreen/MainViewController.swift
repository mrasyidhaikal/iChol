//
//  ViewController.swift
//  iChol
//
//  Created by Muhammad Rasyid khaikal on 02/11/20.
//

import UIKit
import FatSecretSwift
import HealthKit

class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var progressView: TopProgressView!
    private var mealTodayView: MealTodayView!

    let healthStore = HKHealthStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth()
        setNavBar()
        setupScrollView()
        setupLayout()
    }
    
    private func setupLayout() {
        
        progressView = TopProgressView()
        mealTodayView = MealTodayView(frame: .zero, rootView: self)
        
        let mainStack = UIStackView(arrangedSubviews: [progressView, mealTodayView])
        mainStack.axis = .vertical
        mainStack.spacing = 56
        mainStack.backgroundColor = Color.background
        scrollView.addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: scrollView.topAnchor,
            bottomAnchor: scrollView.bottomAnchor,
            leadingAnchor: scrollView.safeAreaLayoutGuide.leadingAnchor,
            trailingAnchor: scrollView.safeAreaLayoutGuide.trailingAnchor)
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Color.background
        view.backgroundColor = Color.background
    }

    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = Color.background
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        scrollView.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    private func Auth() {
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
