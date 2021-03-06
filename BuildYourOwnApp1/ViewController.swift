//
//  ViewController.swift
//  BuildYourOwnApp1
//
//  Created by Saurav Desai on 7/22/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bobBody: UIImageView!
    @IBOutlet weak var bobLeftArm: UIImageView!
    @IBOutlet weak var bobRightArm: UIImageView!
    @IBOutlet weak var bobLeftLeg: UIImageView!
    @IBOutlet weak var bobRightLeg: UIImageView!
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet var letterLabels: [UILabel]! // contains all 11 letter labels -> outlet collection
    var misses : Int = 0
    var wordArrays : [[String]] = []
    var words : [String] = []
    var randomNum : Int = -1
    var wordArrayForThisRound : [String] = []
    var wordForThisRound : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordArrays.append(["d", "e", "s", "t", "i", "n", "a", "t", "i", "o", "n"])
        wordArrays.append(["s", "u", "b", "t", "r", "a", "c", "t", "i", "o", "n"])
        wordArrays.append(["u", "n", "s", "t", "o", "p", "p", "a", "b", "l", "e"])
        wordArrays.append(["c", "e", "r", "t", "i", "f", "i", "c", "a", "t", "e"])
        wordArrays.append(["r", "e", "s", "p", "o", "n", "s", "i", "b", "l", "e"])
        wordArrays.append(["a", "g", "r", "i", "c", "u", "l", "t", "u", "r", "e"])
        wordArrays.append(["i", "n", "t", "e", "l", "l", "i", "g", "e", "n", "t"])
        wordArrays.append(["i", "n", "f", "o", "r", "m", "a", "t", "i", "o", "n"])
        for i in 0..<8{
            var toAdd : String = ""
            for j in 0..<11{
                toAdd += wordArrays[i][j]
            }
            words.append(toAdd)
        }
        randomNum = Int(arc4random_uniform(8))
        wordArrayForThisRound = wordArrays[randomNum]
        wordForThisRound = words[randomNum]
        for i in 0..<letterLabels.count{
            letterLabels[i].text = "_"
        }
    }
    
    func resetEverything(){
        for i in 0..<11{
            letterLabels[i].text = "_"
        }
        guessField.text = ""
        misses = 0
        randomNum = Int(arc4random_uniform(8))
        wordArrayForThisRound = wordArrays[randomNum]
        wordForThisRound = words[randomNum]
        bobBody.image = nil
        bobLeftArm.image = nil
        bobRightArm.image = nil
        bobLeftLeg.image = nil
        bobRightLeg.image = nil
    }

    @IBAction func onTappedGuessLetter(sender: AnyObject) {
        if misses <= 4{
            var didMiss : Bool = true
            for i in 0..<wordArrayForThisRound.count{
                if guessField.text == wordArrayForThisRound[i]{
                    letterLabels[i].text = wordArrayForThisRound[i]
                    didMiss = false
                }
            }
            if didMiss == true{
                misses += 1
                switch misses{
                case 1:
                    bobBody.image = UIImage(named: "spongebobBody")
                case 2:
                    bobLeftArm.image = UIImage(named: "spongebobLeftArm")
                case 3:
                    bobRightArm.image = UIImage(named: "spongebobRightArm")
                default:
                    bobLeftLeg.image = UIImage(named: "spongebobLeftLeg")
                    bobRightLeg.image = UIImage(named: "spongebobRightLeg")
                }
            }
            guessField.endEditing(true)
            guessField.text = ""
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guessField.endEditing(true)
        let dvc = segue.destinationViewController as! SecondViewController
        dvc.wordToPrint = wordForThisRound
        let wordEntered : String = guessField.text!
        var guessedCorrectly : Bool = false
        if wordEntered == wordForThisRound{
            guessedCorrectly = true
        }
        dvc.correct = guessedCorrectly
        resetEverything()
    }

}

















