//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Atheer Alahmari on 01/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var playerLabel: UILabel!
    var player = 1  // player 1
    var gameIsActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winGames = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                     [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [0, 4, 8], [2, 4, 6] ]
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
//----------------------------Tic Tac Toa ---------------------------------------
    
    @IBAction func tapAction(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 && gameIsActive {
            gameState[sender.tag-1] = player
        if player == 1 {
            sender.backgroundColor = UIColor.red
            player = 2
        }
        else {
            sender.backgroundColor = UIColor.green
            player = 1
        }
           
        }
        
        checkWin()
        
    }
    
//----------------------------- check Win -------------------------------------
    
    func checkWin() {
        for i in winGames {
            
            if gameState[i[0]] != 0  && gameState[i[0]] == gameState[i[1]] && gameState[i[1]] == gameState[i[2]] {
                gameIsActive = false
                
                if gameState[i[0]] == 1 {

                    playerLabel.text = "Player 1 is Win"
                }
                else  {

                    playerLabel.text = "Player 2 is Win"
                }
              
            }
            
            
            
        }
        
        // ----------------- if is equle --------------------
                var count=0
                for i in 0...(gameState.count-1) {
                    
                    if gameState[i] == 0 {
                        count += 1
                    }

                }
                if count == 0 {
                    playerLabel.text = "It a Draw"
                    
                }
            

    }
    
//------------------------------------------ Reset Game --------------------------------------
    
    @IBAction func ResetBtn(_ sender: UIButton) {
         player = 1  // player 1
         gameIsActive = true
        playerLabel.text = " "
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as! UIButton
            btn.backgroundColor = UIColor.systemBlue
        }

           
    }
    
}
