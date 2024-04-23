//
//  ViewController.swift
//  Counter
//
//  Created by Гена Утин on 22.04.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var textLabel: UILabel!
 
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var counterDicreaseButton: UIButton!
    
    @IBOutlet weak var counterIncreaseButton: UIButton!
    
    public var counter = 0

    public var historyText = "История изменнеий:"

    let dateFormatter = DateFormatter()
    
    public func formatingDate () {
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "Значение счетчика: \(counter)"
        formatingDate()
        historyTextView.text = historyText
        historyTextView.isEditable = false
        
    }

    @IBAction func counterDecreaseDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            textLabel.text = "Значение счетчика: \(counter)"
            historyTextView.text += "\n[\(dateFormatter.string(from: Date.now))]:" + "значение измененно на -1\n"
        } else {
            textLabel.text = "Значение счетчика: \(counter)"
            historyTextView.text += "\n[\(dateFormatter.string(from: Date.now))]:" + "попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction func counterIncreaseDidTap(_ sender: Any) {
        counter += 1
        textLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\n[\(dateFormatter.string(from: Date.now))]:" + "значение измененно на +1\n"
    }
   
    
    @IBAction func updateButtonDidTap(_ sender: Any) {
        counter = 0
        textLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\n[\(dateFormatter.string(from: Date.now))]:" + "значение сброшено\n"
    }
    
    
    
}

