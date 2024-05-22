//
//  arraySolutionViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/19/24.
//


// 3번째 try


import UIKit

class arraySolutionViewController: UIViewController {

    
    @IBOutlet var searchWindowTextField: UITextField!
    @IBOutlet var searchWindowButton: UIButton!
    
    
    @IBOutlet var firstRecommendButton: UIButton!
    @IBOutlet var secondRecommendButton: UIButton!
    @IBOutlet var thirdRecommendButton: UIButton!
    @IBOutlet var fourthRecommendButton: UIButton!
    
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultTextField: UITextField!
    
    
    var newWordArray: Array<String> = ["삼귀자", "갑분싸", "누물보", "윰차", "분좋카", "맛꿀마"]
    var newlyCoinedWord: Array<String> = []
    var explainWord: Array<String> = ["연애를 시작하기 전 썸 단계!", "갑자기 분위기가 싸해진다.", "누구 물어본 사람?", "유명인과 무명인을 차별한다. ㅜ", "분위기 좋은 카페", "맛있다"]
   
    
   
    
    var randomNumber: Int = 0
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchWindowTextField.becomeFirstResponder()
        searchWindow()
        recommendButton()
        resultWindow()
        
    }
    
    func searchWindow() {
        searchWindowTextField.placeholder = "단어를 입력하세요."
        searchWindowTextField.clearButtonMode = .always
        searchWindowButton.tintColor = .white
        searchWindowButton.backgroundColor = .black
    }
    func recommendButton() {
        newlyCoinedWord = newWordArray
        shapeOfRecommendButton(button: firstRecommendButton)
        shapeOfRecommendButton(button: secondRecommendButton)
        shapeOfRecommendButton(button: thirdRecommendButton)
        shapeOfRecommendButton(button: fourthRecommendButton)
    }
    func shapeOfRecommendButton(button: UIButton) {
        
        randomNumber = Int.random(in: 0...newlyCoinedWord.count-1)
        button.setTitle(newlyCoinedWord[randomNumber], for: .normal)
        newlyCoinedWord.remove(at: randomNumber)
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        
        if button.currentTitle!.count <= 2 {
            button.frame.size.width = 40
        } else if button.currentTitle!.count == 3{
            button.frame.size.width = 55
        } else {
            button.frame.size.width = 65
        }
    }
    func resultWindow() {
        resultImageView.image = UIImage.wordLogo
        resultImageView.contentMode = .scaleAspectFill
        resultTextField.font = .systemFont(ofSize: 25, weight: .medium)
        resultTextField.textAlignment = .center
        resultTextField.borderStyle = .none
        
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        compareWord(button: searchWindowButton)
        UserDefaults.standard.set(searchWindowTextField.text, forKey: "\(count)번")
        let df = UserDefaults.standard.string(forKey: "\(count)번")
        count += 1
        print(df)
    }
    /**
    0버 - ㅇㅁㄹㄴ               0번 -ㅇㄹㅇㄹ
     1번 - ㅇㄹㅇㄴㄹ         1번
     2번 - ㅇㄹㅇㄹㅇ
     3번- 554543
     
     */
    @IBAction func firstRecommendButtonTapped(_ sender: UIButton) {
        compareWord(button: sender)
    }
    
    
    
    func compareWord(button: UIButton) {
        if button != searchWindowButton {
            searchWindowTextField.text = button.currentTitle
        }
        resultImageView.image = UIImage.background
        
        for i in 0...newWordArray.count-1 {
            if searchWindowTextField.text == newWordArray[i] {
                resultTextField.text = explainWord[i]
                
                break
            } else {
                resultTextField.text = "다른 단어를 검색하세요!"
            }
        }
        searchWindowTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}
