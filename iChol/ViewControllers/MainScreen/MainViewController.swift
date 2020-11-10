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
    private var progressView: TopProgressView!
    private var mealTodayView: MealTodayView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        HealthKitService.fetchCalorie { (totalCalorie) in
            self.progressView.totalCalorie = totalCalorie
            self.progressView.progress.calorieProgress.animate()
            
        }
        HealthKitService.fetchSugar { (totalSugar) in
            self.progressView.totalSugar = totalSugar
        }
        HealthKitService.fetchSaturatedFat { (saturatedFat) in
            self.progressView.totalFat = saturatedFat
        }
        
        DispatchQueue.main.async {
            self.progressView.configureView()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUser()
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
    private func checkUser(){
        if Core.shared.isNewUser(){
            //show onboarding
            let vc = PageControlDescription()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    private func setNavBar() {
        title = "Today"
        navigationController?.navigationBar.prefersLargeTitles = true
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

class Core{
    static let shared = Core()
    
    func isNewUser() ->Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
