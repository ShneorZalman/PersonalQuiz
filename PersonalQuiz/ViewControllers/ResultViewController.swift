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
    var resultText = ""
    var resultPicture = ""
    
    
    @IBOutlet var resultPictureLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
                countResult(with: results)
        
        print(catPoint)
        print(dogsPoint)
        print(rabbitPoint)
        print(turtlePoint)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("Выгружен resultVC")
    }
    
    func countResult(with answers: [Answer]) {
        for answer in answers {
            switch answer.title {
            case "Рыба":
                catPoint += 1
                dogsPoint += 1
            case "Стейк":
                dogsPoint += 1
                catPoint += 1
            case "Морковь":
                rabbitPoint += 1
            case "Кукуруза":
                turtlePoint += 1
            case "Плавать":
                dogsPoint += 1
            case "Спать":
                catPoint += 1
            case "Oбниматься":
                rabbitPoint += 1
                dogsPoint += 1
            case "Есть":
                turtlePoint += 1
                dogsPoint += 1
                catPoint += 1
            case "Обожаю":
                dogsPoint += 1
            case "Ненавижу":
                catPoint += 1
            case "Не замечаю":
                turtlePoint += 1
            case "Нервничаю":
                rabbitPoint += 1
            default:
                break
            }
        }
        
        if catPoint > dogsPoint && catPoint > rabbitPoint && catPoint > turtlePoint {
            resultTextLabel.text = "Вы кот"
            resultPictureLabel.text = "🐱"
        } else if dogsPoint > catPoint && dogsPoint > rabbitPoint && dogsPoint > turtlePoint {
            resultTextLabel.text = "Вы собака"
            resultPictureLabel.text = "🐶"
        } else if rabbitPoint > catPoint && rabbitPoint > dogsPoint && rabbitPoint > turtlePoint {
            resultPictureLabel.text = "🐰"
        } else if turtlePoint > catPoint && turtlePoint > dogsPoint && turtlePoint > rabbitPoint {
            resultTextLabel.text = "Вы черепаха"
            resultPictureLabel.text = "🐢"
        } else {
            resultTextLabel.text = "Вы не определились"
            resultPictureLabel.text = "🐰🐢🐱🐶"
            
        }

    }
}
