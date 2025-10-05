//
//  TriviaViewController.swift
//  Trivia
//
//  Created by mary ramirez on 10/4/25.
//

import UIKit

class TriviaViewController: UIViewController {
    
    
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardCategory: UILabel!
    @IBOutlet weak var cardField: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var answerStack: UIStackView!

    private var mockData = [TriviaData]();
        private var selectedIndex = 0;
        private var score = 0;
        override func viewDidLoad() {
            super.viewDidLoad()
            mockData = createMockData();


            configure(with: mockData[selectedIndex]);
            answer1.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            answer2.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            answer3.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            answer4.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        }
        @objc func answerButtonTapped(_ sender: UIButton) {
            switch sender {
            case answer1:
                if(answer1.titleLabel?.text == mockData[selectedIndex].answer) {
                    score += 1;
                }
            case answer2:
                if(answer2.titleLabel?.text == mockData[selectedIndex].answer) {
                    score += 1;
                }
            case answer3:
                if(answer3.titleLabel?.text == mockData[selectedIndex].answer) {
                    score += 1;
                }
            case answer4:
                if(answer4.titleLabel?.text == mockData[selectedIndex].answer) {
                    score += 1;
                }
            default:
                break
            }
            selectedIndex += 1;
            if(selectedIndex == 3) {
                let alert = UIAlertController(title: "Game over!", message: "Final score: \(score)/3", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
                selectedIndex = 0;
                score = 0;
            }
            configure(with: mockData[selectedIndex]);
        }
        private func createMockData() -> [TriviaData] {
            let trivia1 = TriviaData(
                question: "What is the capital city of Japan?",
                answer: "Tokyo",
                answerBank: ["Kyoto", "Osaka", "Tokyo", "Hiroshima"],
                category: "Geography"
            )

            let trivia2 = TriviaData(
                question: "Which planet is known as the Red Planet?",
                answer: "Mars",
                answerBank: ["Mars", "Venus", "Jupiter", "Mercury"],
                category: "Science"
            )

            let trivia3 = TriviaData(
                question: "Who painted the Mona Lisa?",
                answer: "Leonardo da Vinci",
                answerBank: ["Leonardo da Vinci", "Pablo Picasso", "Michelangelo", "Vincent van Gogh"],
                category: "Art"
            )

                
                return [trivia1, trivia2, trivia3]
            }
        
        private func configure(with trivia: TriviaData) {
            cardNumber.text = "Question: \(selectedIndex+1)/3"
            cardCategory.text = trivia.category
            cardField.text = trivia.question
            let randomized = trivia.answerBank.shuffled()
            
            // Set button titles safely by checking if there are enough answers
            if randomized.count >= 4 {
                answer1.setTitle(randomized[0], for: .normal)
                answer2.setTitle(randomized[1], for: .normal)
                answer3.setTitle(randomized[2], for: .normal)
                answer4.setTitle(randomized[3], for: .normal)
            } else {
                // Handle the error, perhaps disable the buttons, or show an error message
                print("Not enough answers in the answerBank")
            }
        }
        

    }
