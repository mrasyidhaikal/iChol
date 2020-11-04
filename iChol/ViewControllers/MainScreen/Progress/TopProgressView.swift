//
//  ProgressView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class TopProgressView: UIView {
    
    let progress: ProgressContainerView
   
    var totalCalorie: Double = 0.0
    var totalFat: Double = 0.0
    var totalSugar: Double = 0.0
    
    override init(frame: CGRect) {
        progress = ProgressContainerView()
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func configureView() {
        progress.calorieProgress.configureView(
            howMuchLeft: 2000 - totalCalorie,
            progress: totalCalorie / 2000)
        
        progress.fatProgress.configureView(
            label: "Saturated Fat",
            left: Int(22.2) - Int(totalFat),
            progress: CGFloat(totalFat / 22.2))
        
        progress.sugarProgress.configureView(
            label: "Sugar",
            left: 25 - Int(totalSugar),
            progress: CGFloat(totalSugar / 25))
    }
 
    private func setupLayout() {
        let mainStack = UIStackView(arrangedSubviews: [progress])
        mainStack.spacing = 16
        mainStack.axis = .vertical
        addSubview(mainStack)
        
        progress.setConstraint(
            heighAnchorConstant: 200)
        
        mainStack.setConstraint(
            topAnchor: topAnchor,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


