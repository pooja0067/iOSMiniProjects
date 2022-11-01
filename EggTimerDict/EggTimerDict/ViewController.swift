//
//  ViewController.swift
//  EggTimerDict
//
//  Created by Pooja Patil on 26/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggText: UILabel!
    var eggDict = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var secondremaining = 0
    var totalTime = 0
    var player : AVAudioPlayer?
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func typeOfEggULike(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        totalTime = eggDict[hardness]!
        timer.invalidate()
        progressView.progress = 0.0
        secondremaining = 0
        eggText.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTheTimeForEgg), userInfo: nil, repeats: true)
    }
    
    @objc func updateTheTimeForEgg() {
        if secondremaining < totalTime {
            secondremaining += 1
            progressView.progress = Float(secondremaining)/Float(totalTime)
            print("\(secondremaining) seconds.")
        } else {
            timer.invalidate()
            playSound()
            eggText.text = "Is is done"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "Music", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
}

