//
//  ViewController.swift
//  iChol
//
//  Created by Muhammad Rasyid khaikal on 02/11/20.
//

import UIKit
import HealthKit

class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    
    private var mainProgressView: MainProgressView!
    private var pichoCardView: PichoCardView!
    
    private var waterView: HorizontalView!
    private var activityView: HorizontalView!
    private var activityStack: UIStackView!
    
    private var mealTodayView: MealsTodayView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        mainProgressView.calorieProgress.animate()
        mainProgressView.sugarProgress.animate()
        mainProgressView.satFatProgress.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupMainProgress()
        setupPichoCard()
        setupActivity()
        setupMealTodayView()
    }
    
    private func setupMainProgress() {
        mainProgressView = MainProgressView()
        scrollView.addSubview(mainProgressView)
        
        mainProgressView.setConstraint(
            topAnchor: scrollView.topAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor,
            heighAnchorConstant: 206)
    }
    
    private func setupPichoCard() {
        pichoCardView = PichoCardView(
            mascot: "mascot_sad",
            title: "You haven't started!",
            detail: "Start by logging in what you eat today",
            buttonText: "Log Breakfast",
            rootView: self)
        scrollView.addSubview(pichoCardView)
        
        pichoCardView.setConstraint(
            topAnchor: mainProgressView.bottomAnchor, topAnchorConstant: 24,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor,
            heighAnchorConstant: 130)
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = Color.background
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        scrollView.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
    private func setupActivity() {
        waterView = HorizontalView(
            labelText: "Water",
            detailText: "💧 8 cups remaining",
            iconImage: UIImage(),
            background: Color.blue)
        waterView.setConstraint(heighAnchorConstant: 46)
        
        activityView = HorizontalView(
            labelText: "Activity",
            detailText: "🔥 300cal",
            iconImage: UIImage(),
            background: Color.red)
        activityView.setConstraint(heighAnchorConstant: 46)
        
        activityStack = UIStackView(arrangedSubviews: [waterView, activityView])
        activityStack.spacing = 16
        activityStack.axis = .vertical
        view.addSubview(activityStack)
        activityStack.setConstraint(
            topAnchor: pichoCardView.bottomAnchor, topAnchorConstant: 16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
    private func setupMealTodayView() {
        mealTodayView = MealsTodayView(rootView: self)
        scrollView.addSubview(mealTodayView)
        
        mealTodayView.setConstraint(
            topAnchor: activityStack.bottomAnchor, topAnchorConstant: 24,
            bottomAnchor: scrollView.bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
}

