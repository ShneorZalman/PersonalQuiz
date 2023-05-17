//
//  Question.swift
//  PersonalQuiz
//
//  Created by Zalman Zoteev on 11/05/2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу вы предпочитаете",
                responseType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "кукуруза", animal: .turtle)
                ]
            ),
            Question(
                title: "Что вам нравиться больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Oбниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "Езда на машине",
                responseType: .range,
                answers: [
                    Answer(title: "Обожаю", animal: .dog),
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Не замечаю", animal: .rabbit),
                    Answer(title: "Нервничаю", animal: .turtle)
                    ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case range
}

struct Answer {
    let title: String
    let animal: Animal
    
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
            
        case .dog:
            return "DOG"
        case .cat:
            return "CAT"
        case .rabbit:
            return "RABBIT"
        case .turtle:
            return "TURTLE"
        }
    }
}

 
