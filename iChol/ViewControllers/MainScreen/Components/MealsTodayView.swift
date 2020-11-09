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
    var lunchCard: MealCellView!
    var dinnerCard: MealCellView!
    var snackCard: MealCellView!
    
    override init(frame: CGRect) {
        
        title = UILabel()
        
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    private func setupView() {
      
        title.setFont(text: "Meals Today", size: 22, weight: .bold)
        
        breakFastCard = MealCellView(iconImage: "breakfast", title: "Breakfast", buttonText: "Add Breakfast")
        
        lunchCard = MealCellView(iconImage: "lunch", title: "Lunch", buttonText: "Add Lunch")
        dinnerCard = MealCellView(iconImage: "dinner", title: "Dinner", buttonText: "Add Dinner")
        snackCard = MealCellView(iconImage: "lunch", title: "Snacks", buttonText: "Add Snacks")
        
        addSubview(title)
        addSubview(breakFastCard)
        addSubview(lunchCard)
        addSubview(dinnerCard)
        addSubview(snackCard)
    }
    
    private func setupLayout() {
        title.setConstraint(
            topAnchor: topAnchor,
            leadingAnchor: leadingAnchor)
        
        let mainStack = UIStackView(arrangedSubviews: [breakFastCard, lunchCard, dinnerCard, snackCard])
        mainStack.spacing = 16
        mainStack.axis = .vertical
        addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: title.bottomAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        breakFastCard.setConstraint(heighAnchorConstant: 140)
        lunchCard.setConstraint(heighAnchorConstant: 140)
        dinnerCard.setConstraint(heighAnchorConstant: 140)
        snackCard.setConstraint(heighAnchorConstant: 140)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

