//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Robert Steed on 10/5/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
    
    let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
        return pair1.value > pair2.value
    })
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    
    }
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
}
