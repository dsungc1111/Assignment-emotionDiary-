//
//  ViewController.swift
//  SeSAC0517Assignment
//
//  Created by 최대성 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    
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
    
    var happyCount = 0
    var loveCount = 0
    var likeCount = 0
    var embarraseCount = 0
    var upsetCount = 0
    var depressCount = 0
    var boringCount = 0
    var worryCount = 0
    var sadCount = 0
    
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
        happyButton.setImage(.slime1, for: .normal)
        loveButton.setImage(.slime2, for: .normal)
        likeButton.setImage(.slime3, for: .normal)
        embarraseButton.setImage(.slime4, for: .normal)
        upsetButton.setImage(.slime5, for: .normal)
        depressButton.setImage(.slime6, for: .normal)
        boringButton.setImage(.slime7, for: .normal)
        worryButton.setImage(.slime8, for: .normal)
        sadButton.setImage(.slime9, for: .normal)
    }
    
    func emotionLabel() {
        happyLabel.text = "행복해 0"
        happyLabel.textAlignment = .center
        loveLabel.text = "사랑해 0"
        loveLabel.textAlignment = .center
        likeLabel.text = "좋아해 0"
        likeLabel.textAlignment = .center
        embarraseLabel.text = "당황해 0"
        embarraseLabel.textAlignment = .center
        upsetLabel.text = "속상해 0"
        upsetLabel.textAlignment = .center
        depressLabel.text = "우울해 0"
        depressLabel.textAlignment = .center
        boringLabel.text = "심심해 0"
        boringLabel.textAlignment = .center
        worryLabel.text = "걱정해 0"
        worryLabel.textAlignment = .center
        sadLabel.text = "눈물나 0"
        sadLabel.textAlignment = .center
    }
    
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        happyCount += 1
        happyLabel.text = "행복해 \(happyCount)"
    }
    
    @IBAction func loveButtonTapped(_ sender: UIButton) {
        loveCount += 1
        loveLabel.text = "사랑해 \(loveCount)"
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        likeCount += 1
        likeLabel.text = "좋아해 \(likeCount)"
    }
    
    @IBAction func embarraseButtonTapped(_ sender: UIButton) {
        embarraseCount += 1
        embarraseLabel.text = "당황해 \(embarraseCount)"
    }
    
    
    @IBAction func upsetButtonTapped(_ sender: UIButton) {
        upsetCount += 1
        upsetLabel.text = "속상해 \(upsetCount)"
    }
    
    @IBAction func depressButtonTapped(_ sender: UIButton) {
        depressCount += 1
        depressLabel.text = "우울해 \(depressCount)"
    }
    
    @IBAction func boringButtonTapped(_ sender: UIButton) {
        boringCount += 1
        boringLabel.text = "심심해 \(boringCount)"
    }
    
    @IBAction func worryButtonTapped(_ sender: UIButton) {
        worryCount += 1
        worryLabel.text = "걱정해 \(worryCount)"
    }
    
    @IBAction func sadButtonTapped(_ sender: UIButton) {
        sadCount += 1
        sadLabel.text = "눈물나 \(sadCount)"
    }
    
    
    
    
    
    
    
    
    
}

