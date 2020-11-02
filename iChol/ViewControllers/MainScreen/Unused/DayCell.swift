//
//  DayCell.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    static var reuseIdentifier: String = "DayCell"
    
    let dayLabel = UILabel()
    let dayDateLabel = UILabel()
    
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dayLabel)
        addSubview(containerView)
        
        dayLabel.font = .preferredFont(forTextStyle: .body)
        dayDateLabel.font = .preferredFont(forTextStyle: .headline)
        dayDateLabel.textColor = .white
        
        dayDateLabel.text = "25"
        
        setContainerView()
                
        dayLabel.setConstraint(
            topAnchor: topAnchor,
            centerXAnchor: centerXAnchor)
        containerView.setConstraint(
            topAnchor: dayLabel.bottomAnchor, topAnchorConstant: 8,
            bottomAnchor: bottomAnchor,
            centerXAnchor: centerXAnchor)
    }
    
    private func setContainerView() {
        containerView.setConstraint(
            heighAnchorConstant: 35,
            widthAnchorConstant: 35)
        containerView.layer.cornerRadius = 35/2
        containerView.backgroundColor = Color.green
        
        containerView.addSubview(dayDateLabel)
        dayDateLabel.setConstraint(
            centerXAnchor: containerView.centerXAnchor,
            centerYAnchor: containerView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
