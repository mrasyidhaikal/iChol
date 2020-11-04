//
//  FoodDetailScreen.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import HealthKit

class FoodDetailScreen: UIViewController {
    
    private var scrollView: UIScrollView!
    
    private var nutritionLabel: UILabel!
    private var calorieLabel: UILabel!
    private var calorieAmount: UILabel!
    //    private var addButton: UIButton!
    
    private var protein: HorizontalRow!
    private var carbs: HorizontalRow!
    private var fiber: HorizontalRow!
    private var sodium: HorizontalRow!
    private var cholesterol: HorizontalRow!
    private var sugar: HorizontalRow!
    private var totalFat: HorizontalRow!
    private var saturatedFat: HorizontalRow!
    private var transFat: HorizontalRow!
    private var polyunsaturatedFat: HorizontalRow!
    private var monounsaturatedFat: HorizontalRow!
    
    var foodName: String = ""
    var foodId: String = ""
    
    let healthStore = HKHealthStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        fetchingFood()
        
        CoreDataService.shared.createDailyIntake(id: UUID(), fat: 0, calories: 0, sugar: 0, date: Date())
    }
    
    private func setupView() {
        
        view.backgroundColor = Color.background
        
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        calorieLabel = UILabel()
        calorieLabel.text = "Calories"
        calorieLabel.font = .preferredFont(forTextStyle: .title3)
        scrollView.addSubview(calorieLabel)
        
        calorieAmount = UILabel()
        calorieAmount.text = "324"
        calorieAmount.font = .systemFont(ofSize: 34, weight: .bold)
        scrollView.addSubview(calorieAmount)
   
        nutritionLabel = UILabel()
        nutritionLabel.text = "Nutritional Information"
        nutritionLabel.font = .systemFont(ofSize: 26, weight: .bold)
        scrollView.addSubview(nutritionLabel)
        
        totalFat = HorizontalRow(labelString: "Fat", amount: 0.0, header: true)
        saturatedFat = HorizontalRow(labelString: "Saturated Fat", amount: 0.000)
        transFat = HorizontalRow(labelString: "Trans Fat", amount: 0.000)
        polyunsaturatedFat = HorizontalRow(labelString: "Polyunsaturated Fat", amount: 0.000)
        monounsaturatedFat = HorizontalRow(labelString: "monounsaturatedFat", amount: 0.000)
        
        cholesterol = HorizontalRow(labelString: "Cholesterol", amount: 0.000, header: true)
        scrollView.addSubview(cholesterol)
        
        sodium = HorizontalRow(labelString: "Sodium", amount: 0.000, header: true)
        scrollView.addSubview(sodium)
        
        carbs = HorizontalRow(labelString: "Carbohydrate", amount: 0.000, header: true)
        fiber = HorizontalRow(labelString: "Fiber", amount: 0.000)
        sugar = HorizontalRow(labelString: "Sugars", amount: 0.000)

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handleAdd))
    }
    
    @objc private func handleAdd() {
        NetworkService.shared.getFood(id: foodId) { food in
            switch food {
            case .success(let food):
                guard let servings = food.servings?.first else { return }
                
                HealthKitService.addData(sugar: Double(servings.saturatedFat ?? "0") ?? 0, date: Date(), type: .dietaryFatSaturated, unit: HKUnit.gram())
                HealthKitService.addData(sugar: Double(servings.sugar ?? "0") ?? 0, date: Date(), type: .dietarySugar, unit: HKUnit.gram())
                HealthKitService.addData(sugar: Double(servings.calories ?? "0") ?? 0, date: Date(), type: .dietaryEnergyConsumed, unit: HKUnit.smallCalorie())
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        CoreDataService.shared.addFood(foodName: foodName, date: Date(), eatingTime: .breakfast, calorie: Int(calorieAmount.text ?? "0") ?? 0)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupLayout() {
        
        scrollView.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor
        )
        
        calorieLabel.setConstraint(
            topAnchor: scrollView.topAnchor, topAnchorConstant: 32,
            leadingAnchor: scrollView.leadingAnchor)
        
        calorieAmount.setConstraint(
            topAnchor: calorieLabel.bottomAnchor, topAnchorConstant: 8,
            leadingAnchor: scrollView.layoutMarginsGuide.leadingAnchor)
        
        let mainStack = UIStackView(arrangedSubviews: [saturatedFat, sugar])
        mainStack.axis = .vertical
        mainStack.spacing = 24
        scrollView.addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: calorieAmount.bottomAnchor, topAnchorConstant: 24,
            leadingAnchor: scrollView.leadingAnchor,
            trailingAnchor: scrollView.trailingAnchor)

        nutritionLabel.setConstraint(
            topAnchor: mainStack.bottomAnchor, topAnchorConstant: 32,
            leadingAnchor: scrollView.leadingAnchor,
            trailingAnchor: scrollView.trailingAnchor
        )

        let fatStack = UIStackView(arrangedSubviews: [
                                    totalFat,
                                    transFat,
                                    polyunsaturatedFat,
                                    monounsaturatedFat])
        fatStack.axis = .vertical
        fatStack.spacing = 24
        scrollView.addSubview(fatStack)

        fatStack.setConstraint(
            topAnchor: nutritionLabel.bottomAnchor, topAnchorConstant: 24,
            leadingAnchor: scrollView.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: scrollView.layoutMarginsGuide.trailingAnchor)

        cholesterol.setConstraint(
            topAnchor: fatStack.bottomAnchor, topAnchorConstant: 48,
            leadingAnchor: scrollView.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: scrollView.layoutMarginsGuide.trailingAnchor
        )

        sodium.setConstraint(
            topAnchor: cholesterol.bottomAnchor, topAnchorConstant: 48,
            leadingAnchor: scrollView.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: scrollView.layoutMarginsGuide.trailingAnchor
        )

        let carbStack = UIStackView(arrangedSubviews: [
                                        carbs,
                                        fiber])
        carbStack.axis = .vertical
        carbStack.spacing = 24
        scrollView.addSubview(carbStack)

        carbStack.setConstraint(
            topAnchor: sodium.bottomAnchor, topAnchorConstant: 48,
            bottomAnchor: scrollView.bottomAnchor,
            leadingAnchor: scrollView.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: scrollView.layoutMarginsGuide.trailingAnchor)
    }
    
    private func fetchingFood() {
        NetworkService.shared.getFood(id: foodId) { food in
            switch food {
            case .success(let food):
                guard let servings = food.servings?.first else { return }
                DispatchQueue.main.async {
                    self.navigationItem.title = self.foodName
                    self.calorieAmount.text = servings.calories
                    self.totalFat.setAmount(amount: Double(servings.fat ?? "0.0") ?? 0.0)
                    self.saturatedFat.setAmount(amount: Double(servings.saturatedFat ?? "0.0") ?? 0.0)
                    self.transFat.setAmount(amount: Double(servings.transFat ?? "0.0") ?? 0.0)
                    self.monounsaturatedFat.setAmount(amount: Double(servings.monounsaturatedFat ?? "0.0") ?? 0.0)
                    self.polyunsaturatedFat.setAmount(amount: Double(servings.polyunsaturatedFat ?? "0.0") ?? 0.0)
                    self.cholesterol.setAmount(amount: Double(servings.cholesterol ?? "0.0") ?? 0.0)
                    self.sodium.setAmount(amount: Double(servings.sodium ?? "0.0") ?? 0.0)
                    self.sugar.setAmount(amount: Double(servings.sugar ?? "0.0") ?? 0.0)
                    self.fiber.setAmount(amount: Double(servings.fiber ?? "0.0") ?? 0.0)
                    self.carbs.setAmount(amount: Double(servings.carbohydrate ?? "0.0") ?? 0.0)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}

