//
//  CircularProgressView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class CircularProgressView: UIView {
    
    private var shapeLayer: CAShapeLayer!
    private var calorieLabel: UILabel!
    
    func configureView(howMuchLeft: Int, progress: CGFloat) {
        shapeLayer.strokeEnd = progress * 0.8
        calorieLabel.text = "\(howMuchLeft)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayer()
        
        let label = UILabel()
        label.text = "Calories"
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .callout)
        
        let leftLabel = UILabel()
        leftLabel.text = "left"
        leftLabel.textColor = .black
        leftLabel.font = .preferredFont(forTextStyle: .callout)
        
        calorieLabel = UILabel()
        calorieLabel.text = "2000"
        calorieLabel.textColor = .black
        calorieLabel.font = .systemFont(ofSize: 34, weight: .semibold)
        
        let mainStack = UIStackView(arrangedSubviews: [calorieLabel, label, leftLabel])
        mainStack.axis = .vertical
        mainStack.alignment = .center
        addSubview(mainStack)
        
        mainStack.setConstraint(
            centerXAnchor: centerXAnchor,
            centerYAnchor: centerYAnchor)
    }
    
    private func setupLayer() {
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: 68,
            startAngle: -CGFloat.pi / 2,
            endAngle: 2 * CGFloat.pi,
            clockwise: true)

        let trackLayer = CAShapeLayer()
        trackLayer.lineCap = .round
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = Color.grey.cgColor
        trackLayer.lineWidth = 4
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.lineCap = .round
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = Color.green.cgColor
        shapeLayer.lineWidth = 7
        shapeLayer.strokeStart = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(shapeLayer)
    }
    
    @objc private func handeTap() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "strokeEnd")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
