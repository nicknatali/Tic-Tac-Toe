//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nick Natali on 12/26/2016.
//  Copyright © 2016 Make It Appen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //Game is still going
    var activeGame = true
    
    //1 is nought, 2 is crosses
    var activePlayer = 1
    
    //0 is empty, 1 is nought, 2 is crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8],[2,4,6], [0,4,8]]
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
        }
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        var activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
        
            if activePlayer == 1 {
            
        sender.setImage(UIImage(named: "nought.png"), for: [])
            activePlayer = 2
            
        } else {
            
            sender.setImage(UIImage(named: "cross.png"), for: [])
            activePlayer = 1
            
        }
            
    for combination in winningCombinations {
                
        if  gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
            
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
            
                //We have a winner 
            activeGame = false
            
            if gameState[combination[0]] == 1 {
                winnerLabel.text = "Noughts has won"
            } else {
                winnerLabel.text = "Crosses has won"
            }
            UIView.animate(withDuration: 1, animations: {
                
                self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                
               self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                
                
            })
                    
            
            
                }
                
            }
            
    }
        
        print(sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

