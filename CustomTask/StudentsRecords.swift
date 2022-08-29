//
//  Chart.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import Foundation
import UIKit

class StudentsRecords : UIView {
    
    let mainLayer : CALayer = CALayer()
    let barHeight : CGFloat = 5.0
//    let barLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        layer.addSublayer(mainLayer)
    }
    func drawBar(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat,colour : UIColor,height : CGFloat,rect : CGRect) -> CALayer{
        let barLayer = CALayer()
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
        let yPos : CGFloat = 1
        
        
        let correctAnswersBar = drawBar(xPos: xPosCorrectAnswers, yPos: yPos - 10, startPosition: 0, colour: UIColor.systemGreen, height: frame.height, rect: frame)
        mainLayer.addSublayer(correctAnswersBar)
        
        let skippedVisited = drawBar(xPos: xPosSkippedVisited, yPos: yPos, startPosition: xPosCorrectAnswers, colour: UIColor.systemOrange, height: frame.height - 20, rect: frame)
        mainLayer.addSublayer(skippedVisited)
        
        let partiallyCorrect = drawBar(xPos: xPosPartiallyCorrect, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited, colour: UIColor.systemCyan, height: frame.height - 20, rect: frame)
        mainLayer.addSublayer(partiallyCorrect)
        
        let skippedNotVisited = drawBar(xPos: xPosSkippedNotVisted, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect, colour: UIColor.systemYellow, height: frame.height - 20, rect: frame)
        mainLayer.addSublayer(skippedNotVisited)
        
        let inCorrectAnswers = drawBar(xPos: xPosInCorrectAnswers, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect + xPosSkippedNotVisted, colour: UIColor.systemRed, height: frame.height - 20, rect: frame)
        mainLayer.addSublayer(inCorrectAnswers)
        
        
    }
    
    var dataEntries : [QuestionsRecord] = [] {
        didSet {
            mainLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
            mainLayer.frame = bounds
            mainLayer.backgroundColor = UIColor.systemCyan.cgColor
            for i in 0..<dataEntries.count {
                    showEntry(index: i, entry: dataEntries[i])
            }
        }
    }
    
    private func translateWidthValueToXPosition(value : Float) -> CGFloat {
        let width = CGFloat(value) * (mainLayer.frame.width)
        return abs(width)
    }
}




//drawBarCorrectAnswers(xPos: xPosCorrectAnswers, yPos: yPos)
//drawBarSkippedVisted(xPos: xPosSkippedVisited, yPos: yPos, startPosition: xPosCorrectAnswers + 10)
//drawBarPartiallyCorrect(xPos: xPosPartiallyCorrect, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + 10)
//drawBarSkippedNotVisited(xPos: xPosSkippedNotVisted, yPos: yPos, startPosition: xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect + 10)
//drawBarInCorrectAnswers(xPos: xPosInCorrectAnswers, yPos: yPos, startPosition:  xPosCorrectAnswers + xPosSkippedVisited + xPosPartiallyCorrect + xPosSkippedNotVisted + 10)
//}
//
//func drawBarCorrectAnswers(xPos : CGFloat,yPos : CGFloat) {
//let barLayer = CALayer()
//barLayer.frame = CGRect(x: 10, y: yPos, width: xPos, height: 60.0)
//barLayer.backgroundColor = UIColor.systemGreen.cgColor
//barLayer.cornerRadius = 12
//barLayer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
//mainLayer.addSublayer(barLayer)
//}
//
//func drawBarSkippedVisted(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat) {
//let barLayer = CALayer()
//barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: 40.0)
//barLayer.backgroundColor = UIColor.systemOrange.cgColor
//mainLayer.addSublayer(barLayer)
//}
//
//func drawBarPartiallyCorrect(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat) {
//let barLayer = CALayer()
//barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: 40.0)
//barLayer.backgroundColor = UIColor.systemCyan.cgColor
//mainLayer.addSublayer(barLayer)
//}
//
//func drawBarSkippedNotVisited(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat) {
//let barLayer = CALayer()
//barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: 40.0)
//barLayer.backgroundColor = UIColor.systemYellow.cgColor
//mainLayer.addSublayer(barLayer)
//}
//
//func drawBarInCorrectAnswers(xPos : CGFloat,yPos : CGFloat,startPosition : CGFloat) {
//let barLayer = CALayer()
//barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: 40.0)
//barLayer.backgroundColor = UIColor.systemRed.cgColor
//barLayer.cornerRadius = 5
//barLayer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
//mainLayer.addSublayer(barLayer)
//}



//barHeight + CGFloat(dataEntries.count)
