//
//  Model.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import Foundation
import UIKit

struct QuestionsRecord {
    let value : Int
    let label : String
    let colour : UIColor
}

struct LabelRecord {
    let correctAnswersLbl : String
    let skippedVisitedLbl : String
    let partiallyVisitedLbl : String
    let skippedNotVisitedLbl : String
    let inCorrectQuestionsLbl : String
}

