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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabelsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLabelsView() {
        layer.addSublayer(mainLayer)
    }
    
    func creatingATextLayer(string : String,rect : CGRect,xPos : CGFloat,yPos : CGFloat) -> CATextLayer {
        let width = frame.width/2
        let height = 30.0
        let layer = CATextLayer()
        layer.string = string
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = UIColor(red: 33.0/255, green: 34.0/255, blue: 38.0/255, alpha: 8.0).cgColor
        layer.fontSize = 15
        layer.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        layer.alignmentMode = .left
        return layer
    }
    
    func configure(with viewModel : LabelRecord) {
        let textLayer1 = creatingATextLayer(string: viewModel.correctAnswersLbl, rect: frame, xPos: 15.0, yPos: 15.0)
        mainLayer.addSublayer(textLayer1)
        let textLayer2 = creatingATextLayer(string: viewModel.skippedVisitedLbl, rect: frame, xPos: 15, yPos: 45)
        mainLayer.addSublayer(textLayer2)
        let textLayer3  = creatingATextLayer(string: viewModel.skippedNotVisitedLbl, rect: frame, xPos: 15, yPos: 75)
        mainLayer.addSublayer(textLayer3)
        let textLayer4 = creatingATextLayer(string: viewModel.inCorrectQuestionsLbl, rect: frame, xPos: frame.width/2 + 10, yPos: 15)
        mainLayer.addSublayer(textLayer4)
        let textLayer5 = creatingATextLayer(string: viewModel.partiallyVisitedLbl, rect: frame, xPos: frame.width/2 + 10, yPos: 45)
        mainLayer.addSublayer(textLayer5)
    }
    
    func circle(xCord : CGFloat,yCord : CGFloat,centerYPosition : Int,Colour : UIColor,rect : CGRect) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: 5, y: centerYPosition), radius: 4, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.lineWidth = 2
        layer.fillColor = Colour.cgColor
        layer.strokeColor = Colour.cgColor
        layer.path = path.cgPath
        layer.frame = CGRect(x: xCord, y: yCord, width: 10, height: 10)
        return layer
    }
    
    func circleConfigure() {
        let path1 = circle(xCord : 5,yCord : 10,centerYPosition: 15, Colour: UIColor.systemGreen, rect: frame)
        mainLayer.addSublayer(path1)
        let path2 = circle(xCord : 5,yCord : 20,centerYPosition: 35, Colour: UIColor.systemOrange, rect: frame)
        mainLayer.addSublayer(path2)
        let path3 = circle(xCord : 5,yCord : 30,centerYPosition: 55, Colour: UIColor.systemYellow, rect: frame)
        mainLayer.addSublayer(path3)
        let path4 = circle(xCord : frame.width/2,yCord : 10,centerYPosition: 15, Colour: UIColor.systemRed, rect: frame)
        mainLayer.addSublayer(path4)
        let path5 = circle(xCord: frame.width/2,yCord: 20,centerYPosition: 35, Colour: UIColor.systemCyan, rect: frame)
        mainLayer.addSublayer(path5)
    }
}
