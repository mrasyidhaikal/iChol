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
    private var container: UIView!
    
    func configureCell(foodName: String, calorie: String) {
        nameLabel.text = foodName
        calorieLabel.text = "\(calorie) Cal"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Color.background
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .black
        
        calorieLabel = UILabel()
        calorieLabel.font = .systemFont(ofSize: 20, weight: .bold)
        calorieLabel.textColor = .black
        
        container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        
        addSubview(container)
        container.addSubview(nameLabel)
        container.addSubview(calorieLabel)
        
        container.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        nameLabel.setConstraint(
            topAnchor: container.topAnchor, topAnchorConstant: 16,
            leadingAnchor: container.leadingAnchor, leadingAnchorConstant: 16)
        
        calorieLabel.setConstraint(
            topAnchor: container.topAnchor, topAnchorConstant: 16,
            trailingAnchor: container.trailingAnchor, trailingAnchorConstant: -16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
