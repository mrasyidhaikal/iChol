//
//  ProgressContainerView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import HealthKit

class ProgressContainerView: UIView {
    
    let fatProgress: ProgressBarView
    let sugarProgress: ProgressBarView!
    let calorieProgress: CircularProgressView!
    
    override init(frame: CGRect) {
        
        calorieProgress = CircularProgressView()
        fatProgress = ProgressBarView()
        sugarProgress = ProgressBarView()
        
        super.init(frame: frame)
        
        backgroundColor = Color.background
        layer.cornerRadius = 16
        backgroundColor = .white
        
        let divider = UIView()
        divider.backgroundColor = .white
        addSubview(divider)
        
        addSubview(fatProgress)
        addSubview(sugarProgress)
        addSubview(calorieProgress)
        
        divider.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 24,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -24,
            centerXAnchor: centerXAnchor,
            widthAnchorConstant: 1)
        
        fatProgress.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 24,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
        
        sugarProgress.setConstraint(
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -24,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
        
        calorieProgress.setConstraint(
            trailingAnchor: divider.trailingAnchor, trailingAnchorConstant: -90,
            centerYAnchor: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
