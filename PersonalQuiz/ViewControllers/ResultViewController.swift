//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Zalman Zoteev on 15/05/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var results: [Answer]!
    
    var dogsPoint = 0
    var catPoint = 0
    var rabbitPoint = 0
    var turtlePoint = 0

    @IBOutlet var resultPictureLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print(results ?? "netychki")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("Выгружен resultVC")
    }
    
    func countResult() {
    }
}

