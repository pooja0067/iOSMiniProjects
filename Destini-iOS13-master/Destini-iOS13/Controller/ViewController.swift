//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    updateUI()
    }
    
    
    @IBAction func makeAChoice(_ sender: UIButton) {
        let buttonName = sender.currentTitle ?? "None"
        let nextStoryVariable = storyBrain.nextStory(buttonName)
        if nextStoryVariable {
            updateUI()
        } else {
            updateUI()
        }
    }
    
    func updateUI(){
        storyLabel.text = storyBrain.example[storyBrain.index].storyTitle
        choice1Button.setTitle(storyBrain.example[storyBrain.index].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.example[storyBrain.index].choice2, for: .normal)
        updateIndex()
    }
    
    func updateIndex() {
        if storyBrain.index < storyBrain.example.count - 1 {
            storyBrain.index += 1
        } else {
            storyBrain.index = 0
        }
    }
    
}

