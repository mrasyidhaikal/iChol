//
//  MealTodayView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class MealTodayView: UIView {
    
    private var label: UILabel!
    private var mealCollectionView: MealCollectionView!
    
    init(frame: CGRect, rootView: UIViewController) {
        super.init(frame: frame)
        
        backgroundColor = Color.background
        
        label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Meals Today"
        label.textColor = .black
        
        mealCollectionView = MealCollectionView(frame: .zero, collectionViewLayout: nil, rootView: rootView)
        
        addSubview(label)
        addSubview(mealCollectionView)
        
        label.setConstraint(
            topAnchor: topAnchor,
            leadingAnchor: leadingAnchor)
        
        mealCollectionView.setConstraint(
            topAnchor: label.bottomAnchor,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor,
            heighAnchorConstant: 240)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

