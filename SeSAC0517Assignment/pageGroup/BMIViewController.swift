//
//  BMIViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/21/24.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet var bmiTitleLabel: UILabel!
    @IBOutlet var bmiSubTitleLabel: UILabel!
    @IBOutlet var bmiImageView: UIImageView!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var revealPWButton: UIButton!
    @IBOutlet var randomButton: UIButton!
    
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    let peopleHeight = [160, 165, 170, 175, 180, 185, 190, 195]
    
    let peopleWeight = [35.9, 40.6, 45.1, 50.7, 55.4, 60.8, 65.7, 70.1, 75.7, 80.9, 85.6, 90.1, 95.6, 100.0 ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiTitle()
        userInfomation()
        resultBMI()
        
        
    }
    
    func bmiTitle() {
        bmiTitleLabel.text = "BMI Calculator"
        bmiTitleLabel.textAlignment = .left
        bmiTitleLabel.font = .systemFont(ofSize: 30, weight: .bold, width: .compressed)
        bmiSubTitleLabel.text = "당신의 BMI 지수를\n알려드릴게요"
        bmiSubTitleLabel.numberOfLines = 0
        bmiSubTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        bmiImageView.image = UIImage.bmi
        let eyeimage = UIImage(systemName: "eye.slash")
        revealPWButton.setImage(eyeimage, for: .normal)
        
    }
    
    func userInfomation() {
        bodySizeInfomationLabel(size: heightLabel, wording: "키가 어떻게 되시나요?")
        bodySizeInfomationLabel(size: weightLabel, wording: "몸무게는 어떻게 되시나요?")
        inputBodySize(input: heightTextField)
        inputBodySize(input: weightTextField)
        
        randomBMI()
    }
    
    func bodySizeInfomationLabel(size: UILabel, wording: String ) {
        size.text = wording
        size.font = .systemFont(ofSize: 14, weight: .regular)
    }
    func inputBodySize(input: UITextField) {
        input.becomeFirstResponder()
        input.keyboardType = .decimalPad
        input.layer.borderWidth = 2
        input.layer.cornerRadius = 10
    }
    func randomBMI() {
        randomButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomButton.setTitleColor(.systemRed, for: .normal)
        randomButton.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
    func resultBMI() {
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        resultButton.backgroundColor = .purple
        resultButton.layer.borderWidth = 1
        resultButton.layer.cornerRadius = 10
        resultLabel.textAlignment = .center
        resultLabel.font = .boldSystemFont(ofSize: 20)
        resultLabel.text = "결과는..!!"
    }
    
    
    
    @IBAction func revealButtonTapped(_ sender: UIButton) {
        weightTextField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        var randomNumer = Int.random(in: 0...peopleHeight.count-1)
        heightTextField.text = "\(peopleHeight[randomNumer])"
        randomNumer = Int.random(in: 0...peopleWeight.count-1)
        weightTextField.text = "\(peopleWeight[randomNumer])"
        resultButtonTapped(resultButton)
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        
        if heightTextField.text == "" || weightTextField.text == "" || Double(heightTextField.text!) == nil ||
            Double(weightTextField.text!) == nil || (Double(heightTextField.text!)! < 90 && Double(heightTextField.text!)! > 210) || (Double(weightTextField.text!)! < 30 && Double(weightTextField.text!)! > 150) {
            resultLabel.text = "다시 입력해주세요!!"
            
            
        } else {
            let height = Double(heightTextField.text!)!
            let weight = Double(weightTextField.text!)!
            let bmi = weight / (height * height) * 10000
            switch bmi {
            case ..<18.5:
                resultLabel.text = "저체중입니다."
            case 18.5..<23:
                resultLabel.text = "정상입니다."
            case 23..<25:
                resultLabel.text = "비만전단계입니다."
            case 25..<30:
                resultLabel.text = "비만 1단계"
            case 30..<35:
                resultLabel.text = "비만 2단계"
            case 35...:
                resultLabel.text = "비만 3단계"
            default:
                break
            }
        }
        
        
        
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
