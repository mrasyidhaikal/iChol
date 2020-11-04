//
//  FoodDetailScreen.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import HealthKit

class FoodDetailScreen: UIViewController {
    
    private var calorieLabel: UILabel!
    private var calorieAmount: UILabel!
    private var addButton: UIButton!
    
    private var totalFat: HorizontalRow!
    private var saturatedFat: HorizontalRow!
    private var transFat: HorizontalRow!
    private var polyunsaturatedFat: HorizontalRow!
    private var monounsaturatedFat: HorizontalRow!
    
    private var foodName: String = ""
    
    var foodId: String = ""
    let healthStore = HKHealthStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        fetchingFood()
    }
    
    private func setupView() {
        view.backgroundColor = Color.background
        
        calorieLabel = UILabel()
        calorieLabel.text = "Calories Intake"
        calorieLabel.font = .preferredFont(forTextStyle: .title2)
        view.addSubview(calorieLabel)
        
        calorieAmount = UILabel()
        calorieAmount.text = "324"
        calorieAmount.font = .systemFont(ofSize: 34, weight: .bold)
        view.addSubview(calorieAmount)
        
        addButton = UIButton()
        addButton.setAttributedTitle(
            NSAttributedString(
                string: "Add \(foodName)",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ]),
            for: .normal)
      
        addButton.backgroundColor = Color.green
        addButton.layer.cornerRadius = 8
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        totalFat = HorizontalRow(labelString: "Total Fat", amount: 0.0)
        view.addSubview(totalFat)
        
        saturatedFat = HorizontalRow(labelString: "Saturated Fat", amount: 0.000)
        transFat = HorizontalRow(labelString: "Trans Fat", amount: 0.000)
        polyunsaturatedFat = HorizontalRow(labelString: "Polyunsaturated Fat", amount: 0.000)
        monounsaturatedFat = HorizontalRow(labelString: "monounsaturatedFat", amount: 0.000)
    }

    @objc private func handleAdd(){
   
        let date = Date()

        NetworkService.shared.getFood(id: foodId) { food in
            switch food {
            case .success(let food):
                guard let servings = food.servings?.first else { return }
                DispatchQueue.main.async {


                    self.addDataToHealthKit(sugar:Double(servings.saturatedFat ?? "0.0") ?? 0.0, date: date, type: .dietaryFatSaturated, satuan: HKUnit.gram())
                    self.addDataToHealthKit(sugar:Double(servings.sugar ?? "0.0") ?? 0.0, date: date, type: .dietaryFatSaturated, satuan: HKUnit.gram())
                    self.addDataToHealthKit(sugar:Double(servings.calories ?? "0.0") ?? 0.0, date: date, type: .dietaryEnergyConsumed, satuan: HKUnit.smallCalorie())
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        
    }
     func addDataToHealthKit(sugar:Double,date:Date,type:HKQuantityTypeIdentifier,satuan:HKUnit){
        
        guard let dietType = HKQuantityType.quantityType(forIdentifier: type) else {
            fatalError("Error")
        }
        let gram = satuan
        let dietQuantity = HKQuantity(unit: gram, doubleValue: Double(sugar))
        let dietSample = HKQuantitySample(type: dietType, quantity: dietQuantity, start: date, end: date)
        
        
        HKHealthStore().save(dietSample) { (success, error) in
            
            if let error = error {
                
                print("Error Saving : \(error)")
            } else {
                
                print("Successfully saved")
            }
        }
    }

        private func setupLayout() {
            calorieLabel.setConstraint(
                topAnchor: view.safeAreaLayoutGuide.topAnchor, topAnchorConstant: 32,
                leadingAnchor: view.layoutMarginsGuide.leadingAnchor)
            
            calorieAmount.setConstraint(
                topAnchor: calorieLabel.bottomAnchor, topAnchorConstant: 8,
                leadingAnchor: view.layoutMarginsGuide.leadingAnchor)
            
            addButton.setConstraint(
                bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomAnchorConstant: -32,
                leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
                trailingAnchor: view.layoutMarginsGuide.trailingAnchor,
                heighAnchorConstant: 50)
            
            totalFat.setConstraint(
                topAnchor: calorieAmount.bottomAnchor, topAnchorConstant: 32,
                leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
                trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
            
            let mainStack = UIStackView(arrangedSubviews: [
                                            saturatedFat,
                                            transFat,
                                            polyunsaturatedFat,
                                            monounsaturatedFat])
            mainStack.axis = .vertical
            mainStack.spacing = 24
            view.addSubview(mainStack)
            mainStack.setConstraint(
                topAnchor: totalFat.bottomAnchor, topAnchorConstant: 24,
                leadingAnchor: view.layoutMarginsGuide.leadingAnchor, leadingAnchorConstant: 16,
                trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
        }
        
        private func fetchingFood() {
            NetworkService.shared.getFood(id: foodId) { food in
                switch food {
                case .success(let food):
                    guard let servings = food.servings?.first else { return }
                    DispatchQueue.main.async {
                        self.calorieAmount.text = servings.calories
                        self.totalFat.setAmount(amount: Double(servings.fat ?? "0.0") ?? 0.0)
                        self.saturatedFat.setAmount(amount: Double(servings.saturatedFat ?? "0.0") ?? 0.0)
                        self.transFat.setAmount(amount: Double(servings.transFat ?? "0.0") ?? 0.0)
                        self.monounsaturatedFat.setAmount(amount: Double(servings.monounsaturatedFat ?? "0.0") ?? 0.0)
                        self.polyunsaturatedFat.setAmount(amount: Double(servings.polyunsaturatedFat ?? "0.0") ?? 0.0)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
        
    }
    
    class HorizontalRow: UIView {
        
        private let label: UILabel
        private let amountLabel: UILabel
        
        init(labelString: String, amount: Double) {
            label = UILabel()
            amountLabel = UILabel()
            
            super.init(frame: .zero)
            
            label.text = labelString
            amountLabel.text = "\(amount)g"
            
            let mainStack = UIStackView(arrangedSubviews: [label, amountLabel])
            mainStack.axis = .horizontal
            mainStack.distribution = .equalCentering
            addSubview(mainStack)
            
            mainStack.setConstraint(
                leadingAnchor: leadingAnchor,
                trailingAnchor: trailingAnchor,
                centerYAnchor: centerYAnchor)
        }
        
        func setAmount(amount: Double) {
            amountLabel.text = "\(amount)g"
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
