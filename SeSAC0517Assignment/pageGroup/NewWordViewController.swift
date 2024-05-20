//
//  NewWordViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/17/24.
//

//
//첫번째 try


import UIKit

class NewWordViewController: UIViewController {

    
    
    @IBOutlet var explanationImageView: UIImageView!
    @IBOutlet var searchBoxTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var resultBoxLabel: UILabel!
    
    @IBOutlet var firstRecommendWordButton: UIButton!
    @IBOutlet var secondRecommendWordButton: UIButton!
    @IBOutlet var thirdRecommendWordButton: UIButton!
    @IBOutlet var fourthRecommendWordButton: UIButton!
    
    
    
    var newWordBox: [String : String] = ["삼귀자": "연애를 시작하기 전 썸 단계!", "갑분싸" : "갑자기 분위기가 싸해진다.", "누물보" : "누구 물어본 사람?", "분좋카" : "분위기 좋은 카페", "윰차" : "유명인과 무명인을 차별한다. ㅜ", "맛꿀마" : "맛있다"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseDesign()
        recommendedWordBox()
    }
    
    
    func baseDesign() {
        explanationImageView.image = UIImage.wordLogo
        explanationImageView.contentMode = .scaleAspectFill
        
        searchBoxTextField.placeholder = "단어를 입력해주세요."
        searchBoxTextField.borderStyle = .line
        
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        resultBoxLabel.textAlignment = .center
        resultBoxLabel.font = .systemFont(ofSize: 25, weight: .regular)
    }
    func recommendedWordBox(){
        var randomRecommendWord = Array(newWordBox.keys)
        
        var randomIndex = Int.random(in: 0...randomRecommendWord.count-1)
        firstRecommendWordButton.setTitle(randomRecommendWord[randomIndex], for: .normal)
        randomRecommendWord.remove(at: randomIndex)
        buttonShape(button: firstRecommendWordButton)
        
        randomIndex = Int.random(in: 0...randomRecommendWord.count-1)
        secondRecommendWordButton.setTitle(randomRecommendWord[randomIndex], for: .normal)
        randomRecommendWord.remove(at: randomIndex)
        buttonShape(button: secondRecommendWordButton)
        
        
        randomIndex = Int.random(in: 0...randomRecommendWord.count-1)
        thirdRecommendWordButton.setTitle(randomRecommendWord[randomIndex], for: .normal)
        randomRecommendWord.remove(at: randomIndex)
        buttonShape(button: thirdRecommendWordButton)
        
        randomIndex = Int.random(in: 0...randomRecommendWord.count-1)
        fourthRecommendWordButton.setTitle(randomRecommendWord[randomIndex], for: .normal)
        buttonShape(button: fourthRecommendWordButton)
    }
    func buttonShape(button: UIButton) {
        if button.currentTitle!.count == 3 {
            button.frame.size.width = 55
        }else if button.currentTitle!.count <= 2{
            button.frame.size.width = 40
        }else {
            button.frame.size.width = 65
        }
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
    }
    
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        afterSearch()
        recommendedWordBox()
    }
    
    @IBAction func firstRecommendButtonTapped(_ sender: UIButton) {
        selectRecommendWord(word: firstRecommendWordButton.currentTitle!)
        afterSearch()
    }
    
    @IBAction func secondRecommendButtonTapped(_ sender: UIButton) {
        selectRecommendWord(word: secondRecommendWordButton.currentTitle!)
        afterSearch()
    }
    
    @IBAction func thirdRecommendButonTapped(_ sender: UIButton) {
        selectRecommendWord(word: thirdRecommendWordButton.currentTitle!)
        afterSearch()
    }
    
    @IBAction func fourthRecommendButtonTapped(_ sender: UIButton) {
        selectRecommendWord(word: fourthRecommendWordButton.currentTitle!)
        afterSearch()
    }
    
    func afterSearch () {
        explanationImageView.image = UIImage.background
        for (word, mean) in newWordBox {
            if searchBoxTextField.text == word{
                resultBoxLabel.text = mean
                resultBoxLabel.numberOfLines = 2
                break
            } else {
                resultBoxLabel.text = "다른 단어를 검색하세요. 😅"
            }
        }
    }
    
    
    func selectRecommendWord (word: String) {
        searchBoxTextField.text = word
    }
    
    
    
    
    
    
}
