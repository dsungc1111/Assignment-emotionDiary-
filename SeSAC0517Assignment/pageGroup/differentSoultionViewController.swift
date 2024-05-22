//
//  differentSoultionViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/19/24.
//


//2번째 try
import UIKit

class differentSoultionViewController: UIViewController {

    @IBOutlet var buttonList: [UIButton]!
    
    
    @IBOutlet var searchBoxTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var resultBoxTextField: UITextField!
    @IBOutlet var explanationImageView: UIImageView!
    
    @IBOutlet var firstRecommendWordButton: UIButton!
    
    @IBOutlet var secondRecommedWordButton: UIButton!
    
    @IBOutlet var thirdRecommendWordButton: UIButton!
    
    @IBOutlet var fourthRecommendWordButton: UIButton!
    
    
    
    var newWordBox: [String : String] = ["삼귀자": "연애를 시작하기 전 썸 단계!", "갑분싸" : "갑자기 분위기가 싸해진다.", "누물보" : "누구 물어본 사람?", "분좋카" : "분위기 좋은 카페", "윰차" : "유명인과 무명인을 차별한다. ㅜ", "맛꿀마" : "맛있다"]
    
    var newRandomBox: Array<String> = []
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        baseDesign()
        aboutRecommendButtonSetting()
        searchBoxTextField.becomeFirstResponder()
        
    }
    
    func baseDesign() {
        
        searchBoxTextField.placeholder = "단어를 입력하시오."
        searchBoxTextField.borderStyle = .line
        searchBoxTextField.clearButtonMode = .always
        
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        explanationImageView.image = UIImage.wordLogo
        explanationImageView.contentMode = .scaleAspectFill
        
        resultBoxTextField.textAlignment = .center
        resultBoxTextField.font = .systemFont(ofSize: 30, weight: .regular)
        
    }
    
    func aboutRecommendButtonSetting () {
        
        newRandomBox = Array(newWordBox.keys)
        setRecommendButton(button: firstRecommendWordButton)
        setRecommendButton(button: secondRecommedWordButton)
        setRecommendButton(button: thirdRecommendWordButton)
        setRecommendButton(button: fourthRecommendWordButton)
        
        buttonShape(button: firstRecommendWordButton)
        buttonShape(button: secondRecommedWordButton)
        buttonShape(button: thirdRecommendWordButton)
        buttonShape(button: fourthRecommendWordButton)
    }
    
    func setRecommendButton(button: UIButton) {
      
        let randomNumber = Int.random(in: 0...newRandomBox.count-1)
        button.setTitle(newRandomBox[randomNumber], for: .normal)
        newRandomBox.remove(at: randomNumber)
    }
    
    func buttonShape(button: UIButton) {
        if button.currentTitle!.count <= 2 {
            button.frame.size.width = 40
        } else if button.currentTitle!.count == 3 {
            button.frame.size.width = 55
        }else {
            button.frame.size.width = 65
        }
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        changeAfterClickNewWordButton(keyword: searchButton)
        UserDefaults.standard.set(searchBoxTextField.text, forKey: "\(count)")
        let word = UserDefaults.standard.string(forKey: "\(count)")
        buttonList[count].setTitle(word, for: .normal)
        count += 1
        if count == 4 {count = 0}
    }

    @IBAction func firstRecommendButtonTapped(_ sender: UIButton) {
       
        changeAfterClickNewWordButton(keyword: sender)
    }
    
    
    
    func changeAfterClickNewWordButton(keyword: UIButton) {
        explanationImageView.image = UIImage.background
        
        if keyword != searchButton{
            searchBoxTextField.text = keyword.currentTitle
        }
        for (key, value) in newWordBox {
            if searchBoxTextField.text == key {
                resultBoxTextField.text = value
                break
            } else {
                resultBoxTextField.text = "다른 단어 검색해봐"
            }
        }
        searchBoxTextField.resignFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    
    
}
