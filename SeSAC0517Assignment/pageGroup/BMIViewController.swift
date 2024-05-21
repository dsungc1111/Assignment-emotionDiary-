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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiTitle()
        userInfomation()
        resultBMI()
    }
    
    func bmiTitle() {
        bmiTitleLabelFunction(title: bmiTitleLabel, phrase: "BMI Calculator")
        bmiTitleLabel.textAlignment = .left
        bmiTitleLabel.font = .systemFont(ofSize: 30, weight: .bold, width: .compressed)
        bmiTitleLabelFunction(title: bmiSubTitleLabel, phrase: "당신의 BMI 지수를 알려드릴게요.")
        bmiSubTitleLabel.numberOfLines = 0
        bmiSubTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        bmiImageView.image = UIImage.bmi
        
        let eyeimage = UIImage(systemName: "eye.slash")
        revealPWButton.setImage(eyeimage, for: .normal)
    }
    func bmiTitleLabelFunction(title: UILabel, phrase: String){
        title.text = phrase
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
    }
    
    
    
    @IBAction func revealButtonTapped(_ sender: UIButton) {
        weightTextField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        var peopleHeight = Double.random(in: 140...210)
        var peopleWeight = Double.random(in: 35...140)
        
        heightTextField.text = "\(String(format: "%.2f", peopleHeight))"
        weightTextField.text = "\(String(format: "%.2f", peopleWeight))"
        resultButtonTapped(resultButton)
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        var resultMessage = " "
        
        if heightTextField.text == "" || weightTextField.text == "" || Double(heightTextField.text!) == nil ||
            Double(weightTextField.text!) == nil || (Double(heightTextField.text!)! < 90 && Double(heightTextField.text!)! > 210) || (Double(weightTextField.text!)! < 30 && Double(weightTextField.text!)! > 150) {
            resultMessage = "다시 입력해주세요!!"
        } else {
            var bmi = calculateBMI()
            switch bmi {
            case ..<18.5:
                resultMessage = "저체중입니다."
            case 18.5..<23:
                resultMessage = "정상입니다."
            case 23..<25:
                resultMessage = "비만전단계입니다."
            case 25..<30:
                resultMessage = "비만 1단계"
            case 30..<35:
                resultMessage = "비만 2단계"
            case 35...:
                resultMessage = "비만 3단계"
            default:
                break
            }
        }
        let alert = UIAlertController(title: "BMI결과", message: resultMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    
    func calculateBMI() -> Double{
        let height = Double(heightTextField.text!)!
        let weight = Double(weightTextField.text!)!
        let bmi = weight / (height * height) * 10000
        return bmi
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
