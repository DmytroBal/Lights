//
//  ViewController.swift
//  Lights
//
//  Created by Dmytro Bal on 31.07.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 14
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }

    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
        }
    }
    
}

