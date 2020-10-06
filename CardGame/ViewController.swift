//
//  ViewController.swift
//  CardGame
//
//  Created by ZoeZ on 9/30/20.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    struct PokerCards {
        var Level:Int
        var Number:Int
        var PokerName:String
        var Suit:String
    }
    
    var numbers = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    var suits = ["C","D","H","S"]
    var pokerImageName = ""
    var card: PokerCards?
    var cardArray = [PokerCards(Level: 1, Number: 1, PokerName: "C1", Suit: "C")]
    
    func pokerFunc()-> [PokerCards] {
        for i in 0 ..< suits.count {
            for j in 0 ..< numbers.count {
                pokerImageName =  numbers[j] + suits[i]
                card = PokerCards(Level: i + 1 , Number: j + 1 , PokerName: pokerImageName, Suit: suits[i] )
                if let card = card {
                    cardArray += [card]
                }
            }
        }
        cardArray.removeFirst()
        return cardArray
    }
    
    @IBOutlet weak var player1a: UIImageView!
    @IBOutlet weak var player1b: UIImageView!
    @IBOutlet weak var player1c: UIImageView!
    @IBOutlet weak var player2a: UIImageView!
    @IBOutlet weak var player2b: UIImageView!
    @IBOutlet weak var player2c: UIImageView!
    
    @IBOutlet weak var isWinner: UILabel!
    
    var val1 = -1
    var val2 = -1
    var val3 = -1
    var val4 = -1
    var val5 = -1
    var val6 = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = pokerFunc()
        initialized()
    }
    func initialized() {
        let player = [player1a, player1b, player1c, player2a, player2b, player2c]
        for i in 0..<player.count {
            player[i]?.image = UIImage(named: "yellow_back")
        }
    }
    
    func play() {
        let val1 = Int.random(in:0..<52)
        let val2 = Int.random(in:0..<52)
        let val3 = Int.random(in:0..<52)
        let val4 = Int.random(in:0..<52)
        let val5 = Int.random(in:0..<52)
        let val6 = Int.random(in:0..<52)

        player1a.image = UIImage(named: cardArray[val1].PokerName)
        player1b.image = UIImage(named: cardArray[val2].PokerName)
        player1c.image = UIImage(named: cardArray[val3].PokerName)
        player2a.image = UIImage(named: cardArray[val4].PokerName)
        player2b.image = UIImage(named: cardArray[val5].PokerName)
        player2c.image = UIImage(named: cardArray[val6].PokerName)
        
        if cardArray[val1].PokerName == "KS" || cardArray[val2].PokerName == "KS" || cardArray[val3].PokerName == "KS" {
            isWinner.text = "Player1 wins"
            alert()
        }
        else if cardArray[val4].PokerName == "KS" || cardArray[val5].PokerName == "KS" || cardArray[val6].PokerName == "KS" {
            isWinner.text = "Player2 wins"
            alert()
        }
        else {
            isWinner.text = "No Winner"
        }
    }

    @IBAction func playAction(_ sender: UIButton) {
        play()
    }
    
    func alert() {
        let refreshAlert = UIAlertController(title: "Play again?", message: "", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.initialized()
        }))
        refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }
    
}

