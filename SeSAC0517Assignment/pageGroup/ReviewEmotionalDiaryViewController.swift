//
//  ReviewEmotionalDiaryViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/24/24.
//

import UIKit

class ReviewEmotionalDiaryViewController: UIViewController {


    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var labelList: [UILabel]!
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    
    @IBOutlet var oneLabel: UILabel!
    @IBOutlet var twoLabel: UILabel!
    @IBOutlet var threeLabel: UILabel!
    @IBOutlet var fourLabel: UILabel!
    @IBOutlet var fiveLabel: UILabel!
    @IBOutlet var sixLabel: UILabel!
    @IBOutlet var sevenLabel: UILabel!
    @IBOutlet var eightLabel: UILabel!
    @IBOutlet var nineLabel: UILabel!
    
    @IBOutlet var resetButton: UIButton!
    
    
    var images: [UIImage]! = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    var emotionWord: [String] = ["종하해", "즐거워", "사랑해", "화나써", "시무룩", "피곤해", "오싹해", "우울해", "눈물나"]
    var count = [0,0,0,0,0,0,0,0,0]
    
    // 1. 버튼 누르면 숫자 오르게  >> 완료
    // 2. 리셋 버튼 누르면 다 0으로 초기화
    // 3. 껐다 켜도 숫자 초기화 x >> 완료
    // 4. 껐다 켰을 때 숫자 메모리 된 숫자에서 +1씩
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
//        buttonShape(button: oneButton)
//        buttonShape(button: twoButton)
//        buttonShape(button: threeButton)
//        buttonShape(button: fourButton)
//        buttonShape(button: fiveButton)
//        buttonShape(button: sixButton)
//        buttonShape(button: sevenButton)
        buttonShape(button: buttonList)
    }
    
    func buttonShape(button: [UIButton]) {
        
        settingTag()
        for i in 0...buttonList.count-1 {
            count[i] = UserDefaults.standard.integer(forKey: "\(i)")
            buttonList[i].setImage(images[i], for: .normal)
            labelList[i].text = "\(emotionWord[i]), \(count[i])"
            labelList[i].textAlignment = .center
        }
        
    }
    
    func settingTag() {
        for i in 0...buttonList.count-1 {
            buttonList[i].tag = i
        }
    }
    
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1
        labelList[sender.tag].text = "\(emotionWord[sender.tag]) \(count[sender.tag])"
        UserDefaults.standard.set(count[sender.tag], forKey: "\(sender.tag)")
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        for i in 0...buttonList.count-1 {
            UserDefaults.standard.setValue(0, forKey: "\(i)")
            count[i] = UserDefaults.standard.integer(forKey: "\(i)")
            labelList[i].text = "\(emotionWord[i]), \(count[i])"
            
            
        }
        
    }

}
