//
//  MainProgressView.swift
//  Picho
//
//  Created by Windy on 09/11/20.
//

import UIKit

class MainProgressView: UIView {
    
    private let satFatLabel: UILabel
    private let satFatLeft: UILabel
    private let satFatTotalLabel: UILabel
    let satFatProgress: SmallCircularProgressView
    
    private let sugarLabel: UILabel
    private let sugarLeft: UILabel
    private let sugarTotalLabel: UILabel
    private var satFatStack: UIStackView!
    let sugarProgress: SmallCircularProgressView
    
    private let calorieLabel: UILabel
    private let totalCalorieLabel: UILabel
    let calorieProgress: CircularProgressView
    
    override init(frame: CGRect) {   
        calorieLabel = UILabel()
        totalCalorieLabel = UILabel()
        calorieProgress = CircularProgressView()
        
        satFatLabel = UILabel()
        satFatTotalLabel = UILabel()
        satFatLeft = UILabel()
        satFatProgress = SmallCircularProgressView()
        
        sugarLabel = UILabel()
        sugarTotalLabel = UILabel()
        sugarLeft = UILabel()
        sugarProgress = SmallCircularProgressView()
        
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        setupCalorie()
        setupSatFat()
        setupSugar()
    }
    
    private func setupCalorie() {
        calorieLabel.setFont(
            text: "Calories",
            size: 17,
            weight: .bold)
        
        totalCalorieLabel.setFont(
            text: "from 2400 cal/day",
            size: 13,
            color: .secondaryLabel)
        
        addSubview(calorieLabel)
        addSubview(calorieProgress)
        addSubview(totalCalorieLabel)
        
        calorieLabel.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            centerXAnchor: centerXAnchor)
        
        calorieProgress.setConstraint(
            centerXAnchor: centerXAnchor,
            centerYAnchor: centerYAnchor,
            heighAnchorConstant: 100, widthAnchorConstant: 100)
        
        totalCalorieLabel.setConstraint(
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            centerXAnchor: centerXAnchor)
    }
    
    private func setupSatFat() {
        satFatLabel.setFont(
            text: "Saturated Fat",
            size: 17,
            weight: .bold)
        
        satFatTotalLabel.setFont(
            text: "from 25g/day",
            size: 13,
            color: .secondaryLabel)
        
        satFatLeft.setFont(
            text: "3g left", size: 13)
        
        satFatStack = UIStackView(
            arrangedSubviews: [satFatLabel,
                               satFatProgress,
                               satFatLeft,
                               satFatTotalLabel])
        satFatStack.alignment = .center
        satFatStack.axis = .vertical
        satFatStack.spacing = 8
        
        addSubview(satFatStack)
        
        satFatStack.setConstraint(
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 8,
            centerYAnchor: centerYAnchor)
        satFatProgress.setConstraint(
            heighAnchorConstant: 50, widthAnchorConstant: 50)
    }
    
    private func setupSugar() {
        sugarLabel.setFont(
            text: "Sugar",
            size: 17,
            weight: .bold)
        
        sugarTotalLabel.setFont(
            text: "from 36g/day",
            size: 13,
            color: .secondaryLabel)
        
        sugarLeft.setFont(
            text: "15g left", size: 13)
        
        let mainStack = UIStackView(
            arrangedSubviews: [sugarLabel,
                               sugarProgress,
                               sugarLeft,
                               sugarTotalLabel])
        mainStack.alignment = .center
        mainStack.axis = .vertical
        mainStack.spacing = 8
        addSubview(mainStack)
        
        mainStack.setConstraint(
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -8,
            centerYAnchor: centerYAnchor)
        mainStack.widthAnchor.constraint(equalTo: satFatStack.widthAnchor).isActive = true
        sugarProgress.setConstraint(
            heighAnchorConstant: 50, widthAnchorConstant: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
