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
    
    var resultMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiTitle()
        userInfomation()
        resultBMI()
        getLastInfomation()
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
    
    func getLastInfomation() {
        let height = UserDefaults.standard.string(forKey: "height")
        heightTextField.text = height
        let weight = UserDefaults.standard.string(forKey: "weight")
        weightTextField.text = weight
    }
    
    
    @IBAction func revealButtonTapped(_ sender: UIButton) {
        weightTextField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        let peopleHeight = Double.random(in: 140...210)
        let peopleWeight = Double.random(in: 35...140)
        randomBodySize(body: heightTextField, size: peopleHeight)
        randomBodySize(body: weightTextField, size: peopleWeight)
        resultButtonTapped(resultButton)
        getBodyData()
    }
    
    func randomBodySize(body: UITextField, size: Double) {
        body.text = "\(String(format: "%.1f", size))"
        body.text = "\(String(format: "%.1f", size))"
    }
    
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        guard let height = Double(heightTextField.text!),
              let weight = Double(weightTextField.text!) else {
            resultMessage = "다시 입력해주세요!!"
            return
        }
        
        let bmi = weight / (height*height) * 10000
        
        
        
        if heightTextField.text == "" || weightTextField.text == "" ||  (Double(heightTextField.text!)! < 90 && Double(heightTextField.text!)! > 210) || (Double(weightTextField.text!)! < 30 && Double(weightTextField.text!)! > 150) {
            resultMessage = "다시 입력해주세요!!"
        } else {
            let bmiString = String(format: "%.1f", bmi)
            switch bmi {
            case ..<18.5:
                resultMessage = "\(bmiString), 저체중입니다."
            case 18.5..<23:
                resultMessage = "\(bmiString), 정상입니다."
            case 23..<25:
                resultMessage = "\(bmiString), 비만전단계입니다."
            case 25..<30:
                resultMessage = "\(bmiString), 비만 1단계"
            case 30..<35:
                resultMessage = "\(bmiString), 비만 2단계"
            case 35...:
                resultMessage = "\(bmiString), 비만 3단계"
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
            getBodyData()
            
        }
        
        
        func getBodyData() {
            UserDefaults.standard.set(heightTextField.text, forKey: "height")
            UserDefaults.standard.set(weightTextField.text, forKey: "weight")
        }
        
        @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
        }
        
        
    }
