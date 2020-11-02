//
//  ProgressContainerView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class ProgressContainerView: UIView {
    
    var fatProgress: ProgressBarView!
    var sugarProgress: ProgressBarView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.background
        layer.cornerRadius = 16
        backgroundColor = .white
        
        let divider = UIView()
        divider.backgroundColor = Color.grey
        addSubview(divider)
        
        fatProgress = ProgressBarView()
        fatProgress.configureView(label: "Saturated Fat", left: 442, progress: 0.5)
        addSubview(fatProgress)
        
        sugarProgress = ProgressBarView()
        sugarProgress.configureView(label: "Sugar", left: 42, progress: 0.4)
        addSubview(sugarProgress)
        
        divider.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 24,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -24,
            centerXAnchor: centerXAnchor,
            widthAnchorConstant: 1)
        
        fatProgress.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
        
        sugarProgress.setConstraint(
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: divider.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
