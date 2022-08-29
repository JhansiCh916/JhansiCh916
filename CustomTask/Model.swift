//
//  Model.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import Foundation

struct QuestionsRecord {
    let correctQuestions : Int
    let skippedVisited : Int
    let partiallyCorrect : Int
    let skippedNotVisited : Int
    let inCorrectQuestions : Int
}

struct LabelRecord {
    let correctAnswersLbl : String
    let skippedVisitedLbl : String
    let partiallyVisitedLbl : String
    let skippedNotVisitedLbl : String
    let inCorrectQuestionsLbl : String
}

