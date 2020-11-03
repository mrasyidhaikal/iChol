//
//  ViewController.swift
//  iChol
//
//  Created by Muhammad Rasyid khaikal on 02/11/20.
//

import UIKit
import FatSecretSwift

class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var progressView: TopProgressView!
    private var mealTodayView: MealTodayView!
    
    private let fatSecretClient = FatSecretClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        setupScrollView()
        setupLayout()
        
//        fatSecretClient.getFood(id: "6712789") { food in
//            print(food)
//        }
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

}
