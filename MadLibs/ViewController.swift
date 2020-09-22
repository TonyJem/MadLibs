//
//  ViewController.swift
//  MadLibs
//
//  Created by Anton on 2020-09-22.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pastTenseVerbTextField: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pastTenseVerbTextField.stringValue = "ate"
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

