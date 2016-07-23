//
//  SecondViewController.swift
//  BuildYourOwnApp1
//
//  Created by Saurav Desai on 7/22/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    var wordToPrint : String = ""
    var stringToPrint : String = ""
    var correct : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        stringToPrint = "The correct word was \(wordToPrint). "
        if correct == true{
            stringToPrint += "You guessed it correctly."
        }
        else{
            stringToPrint += "You guessed it incorrectly."
        }
        label1.text = stringToPrint
    }

}
