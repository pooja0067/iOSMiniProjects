//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Pooja on 28/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var noughtScore = 0
    var crossScore = 0
    var board = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard() {
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(b4)
        board.append(b5)
        board.append(b6)
        board.append(b7)
        board.append(b8)
        board.append(b9)
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if (button.title(for: .normal) == nil) {
                return false
            }
        }
        return true
    }
    
    @IBAction func trunButtonAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkForWin(CROSS) {
            crossScore += 1
            resultAlert(title: "Crosess Win!!")
        }
        if checkForWin(NOUGHT) {
            noughtScore += 1
            resultAlert(title: "Nought Win!!")
        }
        if (fullBoard()) {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String) {
        let message = "\n NoughtScore \(noughtScore) \n\n CrossScore \(crossScore)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { _ in
            self.resetBoard()
        }))
        self.present(alert, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn =  Turn.Cross
            turnLabel.text = CROSS
        } else if firstTurn == Turn.Cross {
            firstTurn =  Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    
    func checkForWin(_ s: String) -> Bool {
        //Horizantal win
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        if thisSymbol(b4, s) && thisSymbol(b5, s) && thisSymbol(b6, s) {
            return true
        }
        if thisSymbol(b7, s) && thisSymbol(b8, s) && thisSymbol(b9, s) {
            return true
        }
        //Vetical  win
        if thisSymbol(b1, s) && thisSymbol(b4, s) && thisSymbol(b7, s) {
            return true
        }
        if thisSymbol(b2, s) && thisSymbol(b5, s) && thisSymbol(b8, s) {
            return true
        }
        if thisSymbol(b3, s) && thisSymbol(b6, s) && thisSymbol(b9, s) {
            return true
        }
        //Diagonal  win
        if thisSymbol(b1, s) && thisSymbol(b5, s) && thisSymbol(b9, s) {
            return true
        }
        if thisSymbol(b3, s) && thisSymbol(b5, s) && thisSymbol(b7, s) {
            return true
        }
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
     
    func addToBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (currentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            } else if (currentTurn == Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

