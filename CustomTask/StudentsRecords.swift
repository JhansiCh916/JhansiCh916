//
//  Chart.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import Foundation
import UIKit

class StudentsMarksRecords : UIView {
    
    var view1 : UIView = UIView(frame: CGRect.zero)
    var barLayer = CALayer()
    let studentRecordDetails : CALayer = CALayer()
    var barWidth: CGFloat = 0.0
    var textLayerYpos : CGFloat = 0
    var yCord : CGFloat = 0
    var centerYPosition : CGFloat = 0
    
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
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: startPosition, y: yPos + 10, width: xPos, height: height)
        barLayer.backgroundColor = colour.cgColor
        return barLayer
    }
    
    
    
    var startPositionsList : [CGFloat] = []
    var startPositionsAfter : [CGFloat] = []
    
    func showEntry(index : Int,entry : QuestionsRecord) {
        
        let xPos : CGFloat = translateWidthValueToXPosition(value: Float(entry.value) / Float(100.0))
        let yPos : CGFloat = 0
        startPositionsList.append(barWidth)
        let AnswersBar = drawBar(xPos: xPos, yPos: index == 0 ? yPos - 10 : yPos, startPosition: index == 0 ? 0 : barWidth , colour: entry.colour, height: index == 0 ?  view1.frame.height : view1.frame.height - 20, rect: frame)
        barWidth += xPos
        startPositionsAfter.append(barWidth)
        
        if round(startPositionsAfter.last ?? 0) == frame.width {
            AnswersBar.cornerRadius = 8
            AnswersBar.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        }
        
        for i in 0..<startPositionsList.count {
            if startPositionsList[i] == 0.0  && (index == i) {
                print("IOS")
                AnswersBar.cornerRadius = 8
                AnswersBar.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
            }
        }
        
        let dataEntries = dataEntries.filter { record in
            if record.value == 100 {
                return true
            }
            return false
        }
        
        if startPositionsAfter.contains(frame.width) && startPositionsAfter.contains(0.0) && !dataEntries.isEmpty {
            AnswersBar.cornerRadius = 8
            AnswersBar.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner]
        }
        
        view1.layer.addSublayer(AnswersBar)
        
        if index == 0 || index == 3 {
            textLayerYpos = 75
            yCord = 50
            centerYPosition = 35
        }
        
        else if index == 1 || index == 4 {
            textLayerYpos = 105
            yCord = 70
            centerYPosition = 45
        }
        
        else {
            textLayerYpos = 135
            yCord = 90
            centerYPosition = 55
        }
        
        let textLayer = creatingATextLayer(string: entry.label, rect: frame, xPos: index > 2 ? frame.width/2 + 10 : 15, textLayerYpos: textLayerYpos)
        studentRecordDetails.addSublayer(textLayer)
        
        let path = circle(xCord : index > 2 ? frame.width/2 : 5,yCord : yCord,centerYPosition: Int(centerYPosition), Colour: entry.colour, rect: frame)
        studentRecordDetails.addSublayer(path)
    }
    
    var dataEntries : [QuestionsRecord] = [] {
        
        didSet {
            studentRecordDetails.sublayers?.forEach({$0.removeFromSuperlayer()})
            studentRecordDetails.frame = CGRect(x: 0, y: 0, width: frame.width - 20, height: frame.height)
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
    
    func creatingATextLayer(string : String,rect : CGRect,xPos : CGFloat,textLayerYpos : CGFloat) -> CATextLayer {
        let width = frame.width/2
        let height = 30.0
        let layer = CATextLayer()
        layer.string = string
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = UIColor(red: 33.0/255, green: 34.0/255, blue: 38.0/255, alpha: 8.0).cgColor
        layer.fontSize = 15
        layer.frame = CGRect(x: xPos, y: textLayerYpos, width: width, height: height)
        layer.alignmentMode = .left
        return layer
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
}
