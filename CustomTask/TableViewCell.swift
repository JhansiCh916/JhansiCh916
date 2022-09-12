//
//  TableViewCell.swift
//  CustomTask
//
//  Created by Jhansi Ch on 12/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var studentsRecords: UIView!
    
    lazy var studentsMarksRecords: StudentsMarksRecords = {
         let studentsMarksRecords = StudentsMarksRecords()
        studentsMarksRecords.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 160)
        print("Frame \(studentsRecords.bounds)")
         return studentsMarksRecords
        }()
    let questions = [0,10,0,80,10]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if questions.sum() == 100 {
            studentsMarksRecords.dataEntries = [QuestionsRecord(value: questions[0], label: " \(questions[0]) Correct Answers", colour: .systemGreen),QuestionsRecord(value: questions[1], label: " \(questions[1]) Skipped Visited", colour: .systemOrange),QuestionsRecord(value: questions[2], label: " \(questions[2]) Partially Correct", colour: .systemCyan),QuestionsRecord(value: questions[3], label: " \(questions[3]) Skipped Not Visited", colour: .systemYellow),QuestionsRecord(value: questions[4], label: " \(questions[4]) InCorrect  Answers", colour: .systemRed)]
        }
        else {
            print("Total number of Questions must be 100")
        }
        
        studentsRecords.addSubview(studentsMarksRecords)

        // Initialization code
    }
    
    override func layoutSubviews() {
//        studentsMarksRecords.frame = studentsRecords.bounds
//        print("Frame in \(studentsMarksRecords.frame)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
