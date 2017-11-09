//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Austin Beydler on 11/8/17.
//  Copyright © 2017 Austin Beydler. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    struct Converter {
        var label = ""
        var input = ""
        var output = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fahrenheitToCelcius = Converter(label: "fahrenheit to celcius", input: "°F", output: "°C")
        let celciusToFahrenheit = Converter(label: "celcius to fahrenheit", input: "°C", output: "°F")
        let milesToKilometers = Converter(label: "miles to kilometers", input: "mi", output: "km")
        let kilometersToMiles = Converter(label: "kilometers to miles", input: "km", output: "mi")
        
        let converters: [Converter] = [fahrenheitToCelcius,celciusToFahrenheit,milesToKilometers,kilometersToMiles]
        
        outputDisplay.text = converters[0].output
        inputDisplay.text = converters[0].input
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButon(_ sender: Any) {
        
        let alert = UIAlertController(title: "choose converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = "°F"
            self.outputDisplay.text = "°C"
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit ", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = "°C"
            self.outputDisplay.text = "°F"
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = "mi"
            self.outputDisplay.text = "km"
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = "km"
            self.outputDisplay.text = "mi"
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}