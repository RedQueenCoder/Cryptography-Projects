//
//  ViewController.swift
//  CaesarCypher
//
//  Created by Janie Clayton-Hasz on 3/7/16.
//  Copyright © 2016 Red Queen Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet weak var encryptedText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func encryptText(sender: AnyObject) {
        encryptedText.text = encryptedString(inputText.text)
    }

}

