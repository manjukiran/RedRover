//
//  ViewController.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let commandCentre = RedRoverCommandCentre(input: InputParser.parse(InputSet.InputParser.input1))
        print(commandCentre.executeMovements())

    }


}

