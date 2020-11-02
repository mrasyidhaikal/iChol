//
//  ProgressView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class TopProgressView: UIView {
    
    var todayLabel: UILabel!
    private var progress: ProgressContainerView!
    var activityCell: ActivityCellView!
    var waterCell: ActivityCellView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.background
        
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        todayLabel = UILabel()
        todayLabel.text = Date().convertToString()
        todayLabel.font = .systemFont(ofSize: 22, weight: .bold)
        addSubview(todayLabel)
        
        progress = ProgressContainerView()
        
        activityCell = ActivityCellView()
        activityCell.configureCell(textLabel: "Activity", textContent: 300, activity: .activity)
        addSubview(activityCell)
        
        waterCell = ActivityCellView()
        waterCell.configureCell(textLabel: "Water", textContent: 100, activity: .water)
        addSubview(waterCell)
    }
    
    private func setupLayout() {
        let mainStack = UIStackView(arrangedSubviews: [todayLabel, progress, activityCell, waterCell])
        mainStack.spacing = 16
        mainStack.axis = .vertical
        addSubview(mainStack)
        
        progress.setConstraint(
            heighAnchorConstant: 180)
        activityCell.setConstraint(
            heighAnchorConstant: 46)
        waterCell.setConstraint(
            heighAnchorConstant: 46)
        
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


