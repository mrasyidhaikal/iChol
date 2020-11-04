//
//  CircularProgressView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class CircularProgressView: UIView {
    
    private let shapeLayer: CAShapeLayer
    private let calorieLabel: UILabel
    private var progress: Double = 0.0
    
    func configureView(howMuchLeft: Double, progress: Double) {
        if progress == 0 {
            shapeLayer.strokeEnd = CGFloat(0.001)
        } else {
            shapeLayer.strokeEnd = CGFloat(progress * 0.8)
        }
        calorieLabel.text = "\(Int(howMuchLeft))"
        
        self.progress = progress * 0.8
    }
    
    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "strokeEnd")
    }
    
    override init(frame: CGRect) {
        
        shapeLayer = CAShapeLayer()
        calorieLabel = UILabel()
        
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
        
        shapeLayer.lineCap = .round
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = Color.green.cgColor
        shapeLayer.lineWidth = 7
        shapeLayer.strokeStart = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
