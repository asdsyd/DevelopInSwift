//
//  ViewController.swift
//  RPS
//
//  Created by Asad Sayeed on 29/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(forState: .start)
    }

    @IBOutlet weak var robotName: UILabel!
    @IBOutlet weak var topMostLabel: UILabel!
    
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var playerSign1: UIButton!
    @IBOutlet weak var playerSign2: UIButton!
    @IBOutlet weak var playerSign3: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playerButton1(_ sender: Any) {
        play(userSign: .rock)
    }
    @IBAction func playerButton2(_ sender: Any) {
        play(userSign: .paper)
    }
    @IBAction func playerButton3(_ sender: Any) {
        play(userSign: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    func updateUI(forState state: GameState) {
        nextLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .white
            topMostLabel.text = "🤖"
            robotName.text = "Hi! My name is Absolutely Incredible"
            playAgain.isHidden = true
            playerSign1.isHidden = false
            playerSign2.isHidden = false
            playerSign3.isHidden = false
            
            playerSign1.isEnabled = true
            playerSign2.isEnabled = true
            playerSign3.isEnabled = true
        case .win:
            view.backgroundColor = state.color
        case .lose:
            view.backgroundColor = state.color
        case .draw:
            view.backgroundColor = state.color
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameState = userSign.gameState(for: computerSign)
        updateUI(forState: gameState)
        
        topMostLabel.text = computerSign.emoji
        playerSign1.isEnabled = false
        playerSign2.isEnabled = false
        playerSign3.isEnabled = false
        
        playerSign1.isHidden = true
        playerSign2.isHidden = true
        playerSign3.isHidden = true
        
        playAgain.isHidden = false
        
        switch userSign {
        case .rock:
            playerSign1.isHidden = false
        case .paper:
            playerSign2.isHidden = false
        case .scissors:
            playerSign3.isHidden = false
        }
        
        playAgain.isHidden = false
        
        
    }
    
}

