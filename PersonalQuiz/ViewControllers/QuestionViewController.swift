//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Zalman Zoteev on 11/05/2023.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers }
    private var answersChosen: [Answer] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        let answerCount = Float(currentAnswers.count - 1)
        rangedSlider.maximumValue = answerCount
        rangedSlider.value = answerCount / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.results = answersChosen
    }
    
    
    // MARK: - IBActions
    @IBAction func rangedAnswerButtonPressed() {
        let index  = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        goToNextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwich, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwich.isOn {
                answersChosen.append(answer)
            }
        }
        goToNextQuestion()
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
     goToNextQuestion()
    }
    
    deinit {
        print("Выгружен QuestionVC")
    }
}

extension QuestionViewController {
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос N \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswer(for: currentQuestion.responseType)
    }
    
    func showCurrentAnswer(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .range: showRangedStackView(with: currentAnswers)
        }
    }
    
    func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
    }
    
    func goToNextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "resultSequew", sender: nil)
    }
    
    func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
}


