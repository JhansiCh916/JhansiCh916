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
        studentsRecords.frame = view.frame(forAlignmentRect: CGRect(x: 10, y: 100, width: view.frame.width - 20 , height: 160))
          return studentsRecords
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if questions.sum() == 100 {
            studentsRecords.dataEntries = [QuestionsRecord(correctQuestions: questions[0], skippedVisited: questions[1], partiallyCorrect: questions[2], skippedNotVisited: questions[3], inCorrectQuestions: questions[4])]
            studentsRecords.configure(with: LabelRecord(correctAnswersLbl: " \(questions[0]) Correct Answers", skippedVisitedLbl: " \(questions[1]) Skipped Visited", partiallyVisitedLbl: " \(questions[2]) Partially Correct", skippedNotVisitedLbl: " \(questions[3]) Skipped Not Visted", inCorrectQuestionsLbl: " \(questions[4]) InCorrect  Answers"))
            studentsRecords.circleConfigure()
            
        }
        else {
            print("Total number of Questions must be 100")
        }
        view.addSubview(studentsRecords)
    }

}
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}

