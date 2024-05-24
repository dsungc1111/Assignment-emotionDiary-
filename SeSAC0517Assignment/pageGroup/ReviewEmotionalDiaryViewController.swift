//
//  ReviewEmotionalDiaryViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/24/24.
//

import UIKit

class ReviewEmotionalDiaryViewController: UIViewController {


    @IBOutlet var buttonList: [UIButton]!
    
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
    
    var images: [UIImage]! = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonShape(button: oneButton)
        buttonShape(button: twoButton)
        buttonShape(button: threeButton)
        buttonShape(button: fourButton)
        buttonShape(button: fiveButton)
        buttonShape(button: sixButton)
        buttonShape(button: sevenButton)
    }
    
    func buttonShape(button: UIButton) {
        
//        buttonTag()
        for i in 0...buttonList.count-1 {
            buttonList[i].setImage(images[i], for: .normal)
        }
        
        
    }
    
//    func buttonTag() {
//        for i in 0...buttonList.count-1 {
//            buttonList[i].tag = i
//            print(buttonList[i], buttonList[i].tag)
//        }
//
//    }
    
    

}
