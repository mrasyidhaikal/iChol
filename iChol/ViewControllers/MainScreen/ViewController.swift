//
//  ViewController.swift
//  iChol
//
//  Created by Muhammad Rasyid khaikal on 02/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var progressView: TopProgressView!
    private var mealTodayView: MealTodayView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        setupScrollView()
        setupLayout()
    }
    
    private func setupLayout() {
        
        progressView = TopProgressView()
        mealTodayView = MealTodayView()
        
        let mainStack = UIStackView(arrangedSubviews: [progressView, mealTodayView])
        mainStack.axis = .vertical
        mainStack.spacing = 32
        mainStack.backgroundColor = Color.background
        
        scrollView.addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Color.background
        view.backgroundColor = Color.background
    }

    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = Color.background
        view.addSubview(scrollView)
        scrollView.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor)
    }

}
