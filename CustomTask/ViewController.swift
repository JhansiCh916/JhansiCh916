//
//  ViewController.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = [20,20,20,20,20]

    lazy var studentsRecords: StudentsRecords = {
          let studentsRecords = StudentsRecords()
        studentsRecords.frame = view.frame(forAlignmentRect: CGRect(x: view.center.x - 140, y: 100, width:  250, height: 150))
          return studentsRecords
       }()
    lazy var questionsDetails : QuestionsDetails = {
        let questionDetails = QuestionsDetails()
        questionDetails.frame = view.frame(forAlignmentRect: CGRect(x: 15, y: 180, width: view.frame.width - 20, height: 100))
        return questionDetails
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if questions.sum() <= 100 {
            studentsRecords.dataEntries = [QuestionsRecord(correctQuestions: questions[0], skippedVisited: questions[1], partiallyCorrect: questions[2], skippedNotVisited: questions[3], inCorrectQuestions: questions[4])]
            questionsDetails.configure(with: LabelRecord(correctAnswersLbl: " \(questions[0]) CorrectAnswers", skippedVisitedLbl: " \(questions[1])  SkippedVisited", partiallyVisitedLbl: " \(questions[2])  PartiallyCorrect", skippedNotVisitedLbl: " \(questions[3]) SkippedNotVisted", inCorrectQuestionsLbl: " \(questions[4]) InCorrectQuestions"))
            questionsDetails.circle()
            
        }
        else {
            print("Total number of Questions must be 100")
        }
        
        view.addSubview(questionsDetails)
        view.addSubview(studentsRecords)
    }


}
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}

