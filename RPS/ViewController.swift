//
//  ViewController.swift
//  RPS
//
//  Created by Carter Smith on 6/12/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentState: GameState = GameState.start
    
    @IBOutlet weak var cpuSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockOutlet: UIButton!
    @IBOutlet weak var paperOutlet: UIButton!
    @IBOutlet weak var scissorsOutlet: UIButton!
    @IBOutlet weak var playAgainOutlet: UIButton!
    
    @IBAction func rockButton(_ sender: UIButton) {
        play(sign: .rock)
    }
    @IBAction func paperButton(_ sender: UIButton) {
        play(sign: .paper)
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        play(sign: .scissors)
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        updateUI(gameState: .start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(gameState: .start)
    }
    
    func play(sign: Sign) {
        rockOutlet.isEnabled = false
        paperOutlet.isEnabled = false
        scissorsOutlet.isEnabled = false
        playAgainOutlet.isHidden = false
        
        let cpuMove = randomSign()
        cpuSign.text = cpuMove.chooseSign
        
        currentState = sign.compareSigns(computer: cpuMove)
        updateUI(gameState: currentState)
        
    }
    
    func updateUI(gameState: GameState) {
        gameStatus.text = gameState.status
        switch gameState {
        case .win:
            view.backgroundColor = UIColor.green
        case .start:
            view.backgroundColor = UIColor.darkGray
        case .lose:
            view.backgroundColor = UIColor.red
        case .draw:
            view.backgroundColor = UIColor.lightGray
        }
        
        if gameState == .start {
            cpuSign.text = "💯"
            playAgainOutlet.isHidden = true
            rockOutlet.isHidden = false
            paperOutlet.isHidden = false
            scissorsOutlet.isHidden = false
            
            rockOutlet.isEnabled = true
            paperOutlet.isEnabled = true
            scissorsOutlet.isEnabled = true
        }
    }

}

