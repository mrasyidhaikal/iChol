//
//  FoodDetailScreen.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import FatSecretSwift

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
    private var servings: [Serving]? = []
    
    var foodId: String = "" {
        didSet {
            NetworkService.shared.getFood(id: foodId) { food in
                switch food {
                case .success(let food):
                    guard let servings = food.servings else { return }
                    self.servings = servings
                case .failure(let err):
                    self.servings = []
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
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
        
        guard let serving = servings?.first else { return }
        let totalFatNumber = Double(serving.fat ?? "0.0")
        let satFatNumber = Double(serving.saturatedFat ?? "0.000")
        let transFatNumber = Double(serving.transFat ?? "0.000")
        let polyFatNumber = Double(serving.polyunsaturatedFat ?? "0.000")
        let monoFatNumber = Double(serving.monounsaturatedFat ?? "0.000")
        
        print(serving)
        
        totalFat = HorizontalRow(labelString: "Total Fat", amount: totalFatNumber ?? 0.0)
        view.addSubview(totalFat)
        
        saturatedFat = HorizontalRow(labelString: "Saturated Fat", amount: satFatNumber ?? 0.000)
        transFat = HorizontalRow(labelString: "Trans Fat", amount: transFatNumber ?? 0.000)
        polyunsaturatedFat = HorizontalRow(labelString: "Polyunsaturated Fat", amount: polyFatNumber ?? 0.000)
        monounsaturatedFat = HorizontalRow(labelString: "monounsaturatedFat", amount: monoFatNumber ?? 0.000)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
