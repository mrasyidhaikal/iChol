//
//  ProgressBarView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class ProgressBarView: UIView {
    
    private var nutritionLabel: UILabel!
    private var howMuchLeftLabel: UILabel!
    private var progressView: HorizontalProgressView!
    
    func configureView(label: String, left: Int, progress: CGFloat) {
        self.nutritionLabel.text = label
        self.howMuchLeftLabel.text = "\(left)g left"
        
        if progress == 0 {
            self.progressView.progress = 0.03
        } else {
            self.progressView.progress = progress
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nutritionLabel = UILabel()
        howMuchLeftLabel = UILabel()
        progressView = HorizontalProgressView()
        
        nutritionLabel.textColor = .black
        howMuchLeftLabel.textColor = .black
        howMuchLeftLabel.font = .preferredFont(forTextStyle: .headline)
                
        let mainStack = UIStackView(arrangedSubviews: [nutritionLabel, progressView, howMuchLeftLabel])
        mainStack.axis = .vertical
        mainStack.spacing = 8
        addSubview(mainStack)
        
        mainStack.setConstraint(
            topAnchor: topAnchor,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
        
        progressView.setConstraint(
            heighAnchorConstant: 5)
        progressView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
