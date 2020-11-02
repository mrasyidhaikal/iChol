//
//  MealCell.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class MealCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MealCell"
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let caloriesLabel = UILabel()
    
    func configureCell(title: String, description: String, calories: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        caloriesLabel.text = calories
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.textColor = .black
        
        caloriesLabel.font = .preferredFont(forTextStyle: .largeTitle)
        caloriesLabel.font = .systemFont(ofSize: 34, weight: .bold)
        caloriesLabel.textColor = .black
        
        descriptionLabel.textColor = .black
        
        let calLabel = UILabel()
        calLabel.text = "cal"
        calLabel.textColor = .black
        
        let stack = UIStackView(arrangedSubviews: [caloriesLabel, calLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .lastBaseline
        addSubview(stack)
        
        titleLabel.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 20,
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 20)
        
        descriptionLabel.setConstraint(
            topAnchor: titleLabel.bottomAnchor, topAnchorConstant: 12,
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 20)
        
        stack.setConstraint(
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -20,
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
