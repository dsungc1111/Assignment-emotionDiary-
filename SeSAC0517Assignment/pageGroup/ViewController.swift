//
//  ViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var labelList: [UILabel]!
    @IBOutlet var buttonList: [UIButton]!
    
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var happyLabel: UILabel!
    
    
    @IBOutlet var loveButton: UIButton!
    @IBOutlet var loveLabel: UILabel!
    
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeLabel: UILabel!
    
    
    @IBOutlet var embarraseButton: UIButton!
    @IBOutlet var embarraseLabel: UILabel!
    
    @IBOutlet var upsetButton: UIButton!
    @IBOutlet var upsetLabel: UILabel!
    
    @IBOutlet var depressButton: UIButton!
    @IBOutlet var depressLabel: UILabel!
    
    @IBOutlet var boringButton: UIButton!
    @IBOutlet var boringLabel: UILabel!
    
    
    @IBOutlet var worryButton: UIButton!
    @IBOutlet var worryLabel: UILabel!
    
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var sadLabel: UILabel!
    
    var count = [0,0,0,0,0,0,0,0,0]
    var emotion = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "걱정해", "눈물나"]
    var cuteSlime: [UIImage] = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        emotionButton()
        emotionLabel()

    }

    
    func backgroundImage() {
        backgroundImageView.image = .paperboardTexture9567872
        backgroundImageView.contentMode = .scaleAspectFill
    }

    func emotionButton() {
        //happyButton.setImage(.slime1, for: .normal)
        for i in 0...labelList.count-1 {
            buttonList[i].setImage(cuteSlime[i], for: .normal)
        }
    }
    
    func emotionLabel() {
        for i in 0...labelList.count-1{
            labelList[i].text = "\(emotion[i]) 0"
        }
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1
        labelList[sender.tag].text = "\(emotion[sender.tag]) \(count[sender.tag])"
        
    }
    
    
    
    
    
    
    
    
    
    
}

