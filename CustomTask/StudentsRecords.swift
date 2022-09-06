//
//  Chart.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import Foundation
import UIKit

class StudentsRecords : UIView {
    
    var view1 : UIView = UIView(frame: CGRect.zero)
    let barHeight : CGFloat = 5.0
    var barLayer = CALayer()
    let studentRecordDetails : CALayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        layer.addSublayer(studentRecordDetails)
        addSubview(view1)
    }

    func drawBar(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat,colour : UIColor,height : CGFloat,rect : CGRect) -> CALayer {
        barLayer = CALayer()
        barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: height)
        barLayer.backgroundColor = colour.cgColor
        return barLayer
    }
    
    func showEntry(index : Int,entry : QuestionsRecord) {
    
        let xPosCorrectAnswers : CGFloat = translateWidthValueToXPosition(value: Float(entry.correctQuestions) / Float(100.0))
        let xPosSkippedVisited : CGFloat = translateWidthValueToXPosition(value: Float(entry.skippedVisited) / Float(100.0))
        let xPosPartiallyCorrect : CGFloat = translateWidthValueToXPosition(value: Float(entry.partiallyCorrect) / Float(100.0))
        let xPosSkippedNotVisted : CGFloat = translateWidthValueToXPosition(value: Float(entry.skippedNotVisited) / Float(100.0))
        let xPosInCorrectAnswers : CGFloat = translateWidthValueToXPosition(value: Float(entry.inCorrectQuestions) / Float(100.0))
        let yPos : CGFloat = 0
        
        let correctAnswersBar = drawBar(xPos: xPosCorrectAnswers, yPos: yPos - 10, startPosition: 0, colour: UIColor.systemGreen, height: view1.frame.height, rect: frame)
        view1.layer.addSublayer(correctAnswersBar)
        
        let skippedVisited = drawBar(xPos: xPosSkippedVisited, yPos: yPos, startPosition: xPosCorrectAnswers, colour: UIColor.systemOrange, height: view1.frame.height - 20, rect: frame)
        view1.layer.addSublayer(skippedVisited)
        
        let partiallyCorrect = drawBar(xPos: xPosPartiallyCorrect, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited, colour: UIColor.systemCyan, height: view1.frame.height - 20, rect: frame)
        view1.layer.addSublayer(partiallyCorrect)
        
        let skippedNotVisited = drawBar(xPos: xPosSkippedNotVisted, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect, colour: UIColor.systemYellow, height: view1.frame.height - 20, rect: frame)
        view1.layer.addSublayer(skippedNotVisited)
        
        let inCorrectAnswers = drawBar(xPos: xPosInCorrectAnswers, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect + xPosSkippedNotVisted, colour: UIColor.systemRed, height: view1.frame.height - 20, rect: frame)
        view1.layer.addSublayer(inCorrectAnswers)
    }
    
    var dataEntries : [QuestionsRecord] = [] {
        
        didSet {
            studentRecordDetails.sublayers?.forEach({$0.removeFromSuperlayer()})
            studentRecordDetails.frame = CGRect(x: 0, y: 30, width: frame.width - 20, height: frame.height)
            view1.frame = CGRect(x: 0, y: 0, width: frame.width, height: 52)
            view1.clipsToBounds = true
            view1.layer.cornerRadius = 12
            for i in 0..<dataEntries.count {
                    showEntry(index: i, entry: dataEntries[i])
            }
        }
    }
    
    private func translateWidthValueToXPosition(value : Float) -> CGFloat {
        let width = CGFloat(value) * (layer.frame.width)
        return abs(width)
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
        let textLayer1 = creatingATextLayer(string: viewModel.correctAnswersLbl, rect: frame, xPos: 15.0, yPos: 75.0)
        studentRecordDetails.addSublayer(textLayer1)
        let textLayer2 = creatingATextLayer(string: viewModel.skippedVisitedLbl, rect: frame, xPos: 15, yPos: 105)
        studentRecordDetails.addSublayer(textLayer2)
        let textLayer3  = creatingATextLayer(string: viewModel.skippedNotVisitedLbl, rect: frame, xPos: 15, yPos: 135)
        studentRecordDetails.addSublayer(textLayer3)
        let textLayer4 = creatingATextLayer(string: viewModel.inCorrectQuestionsLbl, rect: frame, xPos: frame.width/2 + 10, yPos: 75)
        studentRecordDetails.addSublayer(textLayer4)
        let textLayer5 = creatingATextLayer(string: viewModel.partiallyVisitedLbl, rect: frame, xPos: frame.width/2 + 10, yPos: 105)
        studentRecordDetails.addSublayer(textLayer5)
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
        let path1 = circle(xCord : 5,yCord : 50,centerYPosition: 35, Colour: UIColor.systemGreen, rect: frame)
        studentRecordDetails.addSublayer(path1)
        let path2 = circle(xCord : 5,yCord : 70,centerYPosition: 45, Colour: UIColor.systemOrange, rect: frame)
        studentRecordDetails.addSublayer(path2)
        let path3 = circle(xCord : 5,yCord : 90,centerYPosition: 55, Colour: UIColor.systemYellow, rect: frame)
        studentRecordDetails.addSublayer(path3)
        let path4 = circle(xCord : frame.width/2,yCord : 50,centerYPosition: 35, Colour: UIColor.systemRed, rect: frame)
        studentRecordDetails.addSublayer(path4)
        let path5 = circle(xCord: frame.width/2,yCord: 70,centerYPosition: 45, Colour: UIColor.systemCyan, rect: frame)
        studentRecordDetails.addSublayer(path5)
    }
}
