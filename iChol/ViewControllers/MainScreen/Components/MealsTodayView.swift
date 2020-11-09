//
//  MealsTodayView.swift
//  Picho
//
//  Created by Windy on 09/11/20.
//

import UIKit

class MealsTodayView: UIView {
    
    private let title: UILabel
    
    var breakFastCard: MealCellView!
    
    override init(frame: CGRect) {
        
        title = UILabel()
        
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        
    }
    
    private func setupView() {
        title.setFont(text: "Meals Today", size: 22, weight: .bold)
        addSubview(title)
        
        breakFastCard = MealCellView(iconImage: "breakfast", title: "Breakfast", buttonText: "Add Breakfast")
        addSubview(breakFastCard)
        
    }
    
    private func setupLayout() {
        title.setConstraint(
            topAnchor: topAnchor,
            leadingAnchor: leadingAnchor)
        
        let mainStack = UIStackView(arrangedSubviews: [breakFastCard])
        mainStack.spacing = 16
        mainStack.axis = .vertical
        addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: title.bottomAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        breakFastCard.setConstraint(heighAnchorConstant: 140)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

