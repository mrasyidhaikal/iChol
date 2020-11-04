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
    
    func configureCell(foodName: String, description: String) {
        nameLabel.text = foodName
        
        let components = description.split(separator: "|")
        let calories = components[0]
        var fat = components[1]
        fat.removeFirst()
        var sugar = components[3]
        sugar.removeFirst()
        
        print(description)

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
        calorieLabel.textColor = .black
        
        fatLabel = UILabel()
        sugarLabel = UILabel()
        
        container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        
        addSubview(container)
        container.addSubview(nameLabel)
        
        container.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        nameLabel.setConstraint(
            topAnchor: container.topAnchor, topAnchorConstant: 16,
            leadingAnchor: container.leadingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: container.trailingAnchor, trailingAnchorConstant: -16)
        
        let mainStack = UIStackView(arrangedSubviews: [calorieLabel, fatLabel, sugarLabel])
        mainStack.spacing = 4
        mainStack.axis = .vertical
        mainStack.alignment = .leading
        container.addSubview(mainStack)

        mainStack.setConstraint(
            topAnchor: nameLabel.bottomAnchor, topAnchorConstant: 4,
            bottomAnchor: container.bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: container.leadingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: container.trailingAnchor, trailingAnchorConstant: -16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
