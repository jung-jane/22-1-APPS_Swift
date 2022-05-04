//
//  CountryDefinitionViewController.swift
//  Country List
//
//  Created by 정제인 on 2022/05/04.
//

import UIKit

class CountryDefinitionViewController:
    UIViewController {

    @IBOutlet weak var bigFlagLabel: UILabel!
    
    @IBOutlet weak var countryDefinitionLabel: UILabel!
    
    var country = "🐰";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigFlagLabel.text = country;
        
        //let flags = ["🇧🇷", "🇳🇿", "🇵🇰", "🇵🇹", "🇹🇷"];
        
        if country == "🇧🇷" {
            countryDefinitionLabel.text = "Brazil"
        }
        if country == "🇳🇿" {
            countryDefinitionLabel.text = "NewZealand (Kia Ora)"
        }
        if country == "🇵🇰" {
            countryDefinitionLabel.text = "Pakistan"
        }
        if country == "🇵🇹" {
            countryDefinitionLabel.text = "Portugal"
        }
        if country == "🇹🇷" {
            countryDefinitionLabel.text = "Turkey"
        }
        
        
    }

}
