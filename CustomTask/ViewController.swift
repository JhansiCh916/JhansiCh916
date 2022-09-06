//
//  ViewController.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = [40,10,10,5,35]

    lazy var studentsRecords: StudentsRecords = {
          let studentsRecords = StudentsRecords()
        studentsRecords.frame = view.frame(forAlignmentRect: CGRect(x: 10, y: 100, width: view.frame.width - 20 , height: 160))
          return studentsRecords
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if questions.sum() == 100 {
            studentsRecords.dataEntries = [QuestionsRecord(value: questions[0], label: " \(questions[0]) Correct Answers", colour: .systemGreen),QuestionsRecord(value: questions[1], label: " \(questions[1]) Skipped Visited", colour: .systemOrange),QuestionsRecord(value: questions[2], label: " \(questions[2]) Partially Correct", colour: .systemCyan),QuestionsRecord(value: questions[3], label: " \(questions[3]) Skipped Not Visited", colour: .systemYellow),QuestionsRecord(value: questions[4], label: " \(questions[4]) InCorrect  Answers", colour: .systemRed)]
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

