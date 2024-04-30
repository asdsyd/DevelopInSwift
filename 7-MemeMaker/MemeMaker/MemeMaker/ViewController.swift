//
//  ViewController.swift
//  MemeMaker
//
//  Created by Asad Sayeed on 30/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    //IB Outlets
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    //Instance properties
    let topChoices = [
        CaptionOption(emoji: "🕶️", caption: "You know what's cool?"),
        CaptionOption(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know whwat I love?")
    ]
    
    let bottomChoices = [
        CaptionOption(emoji: "🐱", caption: "Cats wearing hats like me"),
        CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"),
        CaptionOption(emoji: "🐒", caption: "AI Monkeys being smart")
    ]
    
    //VDL
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateCaptions()
    }
    
    
    
    func updateCaptions() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
    @IBAction func topSegmentChange(_ sender: Any) {
        updateCaptions()
    }
    
    @IBAction func bottomSegmentChange(_ sender: Any) {
        updateCaptions()
    }
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
}

