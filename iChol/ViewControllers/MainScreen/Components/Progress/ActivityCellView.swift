//
//  ActivityCellView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

enum ActivityType {
    case activity
    case water
}

class ActivityCellView: UIView {
    
    var label: UILabel!
    var contentLabel: UILabel!
    
    func configureCell(textLabel: String, textContent: Int, activity: ActivityType) {
        label.text = textLabel
        if activity == .activity {
            contentLabel.text = "\(textContent) cal"
            backgroundColor = #colorLiteral(red: 0.9958278537, green: 0.4418442547, blue: 0, alpha: 1)
        } else {
            contentLabel.text = "\(textContent) ml"
            backgroundColor = #colorLiteral(red: 0, green: 0.7325749993, blue: 1, alpha: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        
        label = UILabel()
        contentLabel = UILabel()
        
        addSubview(label)
        addSubview(contentLabel)
        
        label.font = .preferredFont(forTextStyle: .title3)
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        contentLabel.font = .preferredFont(forTextStyle: .body)
        contentLabel.font = .boldSystemFont(ofSize: 17)
        contentLabel.textColor = .white
        
        let mainStack = UIStackView(arrangedSubviews: [label, contentLabel])
        mainStack.axis = .horizontal
        mainStack.distribution = .equalSpacing
        addSubview(mainStack)
        
        mainStack.setConstraint(
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 12,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -12,
            centerYAnchor: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

