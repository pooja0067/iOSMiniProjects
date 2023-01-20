//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    var index = 0
    var example = [Story(storyTitle: "You see a fork in the road.", choice1: "Take a left", choice2: "Take a right"), Story(storyTitle: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),Story(storyTitle: "You find a treasure chest", choice1: "Open it.", choice2: "Checks for traps.")]
    
    func nextStory(_ userChoice: String) -> Bool {
        if userChoice == example[index].storyTitle {
            return true
        } else {
            return false
        }
    }
    
    func storyTitle() -> String {
        return example[index].storyTitle ?? ""
    }
    
    func getChoice1() -> String {
        example[index].choice1 ?? ""
    }
    
    func getChoice2() -> String {
        example[index].choice2 ?? ""
    }
}


