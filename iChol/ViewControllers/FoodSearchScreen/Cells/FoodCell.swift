//
//  FoodCell.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class FoodCell: UITableViewCell {
    
    static let reuseIdentifier = "FoodCell"
    
    private var nameLabel: UILabel!
    private var calorieLabel: UILabel!
    private var fatLabel: UILabel!
    private var sugarLabel: UILabel!
    private var container: UIView!
    private var logButton: UIButton!
    
    var isLogged = false
    
    func configureCell(foodName: String, description: String) {
        nameLabel.text = foodName
        
        let components = description.split(separator: "|")
        let calories = components[0]
        var fat = components[1]
        fat.removeFirst()
        var sugar = components[3]
        sugar.removeFirst()

        fatLabel.text = String(fat)
        calorieLabel.text = String(calories)
        sugarLabel.text = String(sugar)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Color.background
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.lineBreakMode = .byTruncatingTail
        
        calorieLabel = UILabel()
        calorieLabel.font = .systemFont(ofSize: 17, weight: .regular)
        calorieLabel.textColor = Color.greySecondary
        
        fatLabel = UILabel()
        sugarLabel = UILabel()
        fatLabel.textColor = Color.greySecondary
        sugarLabel.textColor = Color.greySecondary
        
        logButton = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 44, weight: .bold, scale: .large)
        logButton.setImage(UIImage(systemName: "plus.square", withConfiguration: config), for: .normal)
        logButton.addTarget(self, action: #selector(handleLogging), for: .touchUpInside)
        
        container = UIView()
        container.backgroundColor = .white
        
        addSubview(container)
        
        container.setConstraint(
            topAnchor: topAnchor,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        let nutritionStack = UIStackView(arrangedSubviews: [calorieLabel, fatLabel, sugarLabel])
        nutritionStack.spacing = 4
        nutritionStack.axis = .vertical
        nutritionStack.alignment = .leading
        nutritionStack.distribution = .fill
        
        let foodStack = UIStackView(arrangedSubviews: [nameLabel, nutritionStack])
        foodStack.spacing = 2
        foodStack.axis = .vertical
        foodStack.alignment = .leading
        foodStack.distribution = .fillProportionally
        
        let mainStack = UIStackView(arrangedSubviews: [foodStack, logButton])
        mainStack.axis = .horizontal
        mainStack.distribution = .fill
        mainStack.alignment = .fill
        container.addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: container.topAnchor, topAnchorConstant: 16,
            bottomAnchor: container.bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: container.leadingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: container.trailingAnchor, trailingAnchorConstant: -16)
    }
    
    @objc private func handleLogging() {
        print("Logged")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
