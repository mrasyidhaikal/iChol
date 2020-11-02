//
//  CircularProgressView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class CircularProgressView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    private func setupLayer() {
        let shapeLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: 100,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = Color.green.cgColor
        shapeLayer.lineWidth = 10
        
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
