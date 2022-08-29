//
//  QuestionsDetails.swift
//  CustomTask
//
//  Created by Jhansi Ch on 27/08/22.
//

import Foundation
import UIKit

 
class QuestionsDetails : UIView {
    
    private let mainLayer : CALayer = CALayer()
    private let shapeLayer1 : CAShapeLayer = CAShapeLayer()
    private let shapeLayer2 : CAShapeLayer = CAShapeLayer()
    private let shapeLayer3 : CAShapeLayer = CAShapeLayer()
    private let shapeLayer4 : CAShapeLayer = CAShapeLayer()
    private let shapeLayer5 : CAShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabelsView()
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        addSubview(thirdLabel)
        addSubview(fourthLabel)
        addSubview(fifthLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLabelsView() {
        layer.addSublayer(mainLayer)
        mainLayer.addSublayer(shapeLayer1)
        mainLayer.addSublayer(shapeLayer2)
        mainLayer.addSublayer(shapeLayer3)
        mainLayer.addSublayer(shapeLayer4)
        mainLayer.addSublayer(shapeLayer5)
    }
    
    private let primaryLabel : UILabel = {
        let primaryLabel = UILabel()
        primaryLabel.numberOfLines = 1
        primaryLabel.textColor = .black
        primaryLabel.textAlignment = .left
        primaryLabel.font = .systemFont(ofSize: 15,weight : .regular)
        return primaryLabel
    }()
    
    private let secondaryLabel : UILabel = {
        let secondaryLabel = UILabel()
        secondaryLabel.numberOfLines = 1
        secondaryLabel.textColor = .black
        secondaryLabel.textAlignment = .left
        secondaryLabel.font = .systemFont(ofSize: 15,weight : .regular)
        return secondaryLabel
    }()
    
    private let thirdLabel : UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.numberOfLines = 1
        thirdLabel.textColor = .black
        thirdLabel.textAlignment = .left
        thirdLabel.font = .systemFont(ofSize: 15,weight : .regular)
        return thirdLabel
    }()
    
    private let fourthLabel : UILabel = {
        let fourthLabel = UILabel()
        fourthLabel.numberOfLines = 1
        fourthLabel.textColor = .black
        fourthLabel.textAlignment = .left
        fourthLabel.font = .systemFont(ofSize: 15,weight : .regular)
        return fourthLabel
    }()
    
    private let fifthLabel : UILabel = {
        let fifthLabel = UILabel()
        fifthLabel.numberOfLines = 1
        fifthLabel.textColor = .black
        fifthLabel.textAlignment = .left
        fifthLabel.font = .systemFont(ofSize: 15,weight : .regular)
        return fifthLabel
    }()
    
    func configure(with viewModel : LabelRecord) {
        primaryLabel.text = viewModel.correctAnswersLbl
        secondaryLabel.text = viewModel.skippedVisitedLbl
        thirdLabel.text = viewModel.skippedNotVisitedLbl
        fourthLabel.text = viewModel.partiallyVisitedLbl
        fifthLabel.text = viewModel.inCorrectQuestionsLbl
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 15, y: 10, width: frame.width/2, height: 30)
        secondaryLabel.frame = CGRect(x: 15, y: 40, width: frame.width/2, height: 30)
        thirdLabel.frame = CGRect(x: 15, y: 70, width: frame.width/2, height: 30)
        fourthLabel.frame = CGRect(x: frame.width/2 + 10, y: 40, width: frame.width/2, height: 30)
        fifthLabel.frame = CGRect(x: frame.width/2 + 10, y: 10, width: frame.width/2, height: 30)
        shapeLayer1.frame = CGRect(x: 5, y: 10, width: 10, height: 10)
        shapeLayer2.frame = CGRect(x: 5, y: 40, width: 10, height: 10)
        shapeLayer3.frame = CGRect(x: 5, y: 70, width: 10, height: 10)
        shapeLayer4.frame = CGRect(x: frame.width/2, y: 10, width: 10, height: 10)
        shapeLayer5.frame = CGRect(x: frame.width/2, y: 40, width: 10, height: 10)
    }
    
     func circle() {
        let path1 = UIBezierPath()
        path1.addArc(withCenter: CGPoint(x: 5, y: 15), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path1.lineWidth = 2
        shapeLayer1.fillColor = UIColor.systemGreen.cgColor
        shapeLayer1.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer1.path = path1.cgPath
        
        let path2 = UIBezierPath()
        path2.addArc(withCenter: CGPoint(x: 5, y: 45), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path1.lineWidth = 2
        shapeLayer2.fillColor = UIColor.systemOrange.cgColor
        shapeLayer2.strokeColor = UIColor.systemOrange.cgColor
        shapeLayer2.path = path1.cgPath
        
        let path3 = UIBezierPath()
        path3.addArc(withCenter: CGPoint(x: 5, y: 75), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path1.lineWidth = 2
        shapeLayer3.fillColor = UIColor.systemYellow.cgColor
        shapeLayer3.strokeColor = UIColor.systemYellow.cgColor
        shapeLayer3.path = path1.cgPath
        
        let path4 = UIBezierPath()
        path4.addArc(withCenter: CGPoint(x: 5, y: 45), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path1.lineWidth = 2
        shapeLayer4.fillColor = UIColor.systemRed.cgColor
        shapeLayer4.strokeColor = UIColor.systemRed.cgColor
        shapeLayer4.path = path1.cgPath
        
        let path5 = UIBezierPath()
        path5.addArc(withCenter: CGPoint(x: 5, y: 45), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path1.lineWidth = 2
        shapeLayer5.fillColor = UIColor.systemCyan.cgColor
        shapeLayer5.strokeColor = UIColor.systemCyan.cgColor
        shapeLayer5.path = path1.cgPath
    }
}
