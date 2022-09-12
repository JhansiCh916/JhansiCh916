//
//  ViewController.swift
//  CustomTask
//
//  Created by Jhansi Ch on 26/08/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
//    let questions = [0,10,0,80,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if questions.sum() == 100 {
//            studentsMarksRecords.dataEntries = [QuestionsRecord(value: questions[0], label: " \(questions[0]) Correct Answers", colour: .systemGreen),QuestionsRecord(value: questions[1], label: " \(questions[1]) Skipped Visited", colour: .systemOrange),QuestionsRecord(value: questions[2], label: " \(questions[2]) Partially Correct", colour: .systemCyan),QuestionsRecord(value: questions[3], label: " \(questions[3]) Skipped Not Visited", colour: .systemYellow),QuestionsRecord(value: questions[4], label: " \(questions[4]) InCorrect  Answers", colour: .systemRed)]
//        }
//        else {
//            print("Total number of Questions must be 100")
//        }
        tableView.dataSource = self
        tableView.delegate = self
//        view.addSubview(tableView)
//        tableView.addSubview(studentsMarksRecords)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.studentsRecords.addSubview(StudentsMarksRecords(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 160)))
        return cell
    }

}
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}

