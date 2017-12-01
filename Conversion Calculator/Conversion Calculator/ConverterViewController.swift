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
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    
    struct Converter {
        var label = ""
        var input = ""
        var output = ""
    }
    
    var currentConverter: Converter = Converter (label: "fahrenheit to celcius", input: "°F", output: "°C")
    var converters: [Converter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fahrenheitToCelcius = Converter(label: "fahrenheit to celcius", input: "°F", output: "°C")
        let celciusToFahrenheit = Converter(label: "celcius to fahrenheit", input: "°C", output: "°F")
        let milesToKilometers = Converter(label: "miles to kilometers", input: "mi", output: "km")
        let kilometersToMiles = Converter(label: "kilometers to miles", input: "km", output: "mi")
        
        converters = [fahrenheitToCelcius,celciusToFahrenheit,milesToKilometers,kilometersToMiles]
        
        outputLabel.text = converters[0].output
        inputLabel.text = converters[0].input
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButon(_ sender: Any) {
        
        

        let alert = UIAlertController(title: "choose converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
           self.inputLabel.text = "°F"
           self.outputLabel.text = "°C"
            self.currentConverter = self.converters[0]
            self.clearDisplay()
            
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit ", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
           self.inputLabel.text = "°C"
           self.outputLabel.text = "°F"
             self.currentConverter = self.converters[1]
            self.clearDisplay()
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
           self.inputLabel.text = "mi"
           self.outputLabel.text = "km"
             self.currentConverter = self.converters[2]
            self.clearDisplay()
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputLabel.text = "km"
            self.outputLabel.text = "mi"
             self.currentConverter = self.converters[3]
            self.clearDisplay()
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func insertNumbers(_ sender: UIButton) {
        if inputDisplay.text!.count > 35 || outputDisplay.text!.count > 35 || inputDisplay.text == "ERROR"{
            
            inputDisplay.text = "ERROR"
            outputDisplay.text = "ERROR"
            
            return
            
        }
        else{
        
        if sender.tag == -1{
            
            if (inputDisplay.text?.contains("."))!{
                decimalButton.isEnabled = false
            }
            else{
                inputDisplay.text = inputDisplay.text! + "."
            }
            return
        }
        
      
        
        if sender.tag != 11{
            
            
        inputDisplay.text = inputDisplay.text! + String(sender.tag)
        }
        
        var to = currentConverter.output
    
        if let value = inputDisplay.text{
            
            outputDisplay.text = convertUnits(to, value)
        }
        }
    }
    
    @IBAction func plusMinus(_ sender: Any) {
        if let number = Double(inputDisplay.text!){
            
            if number == 0{
                return
            }
            else if number <  0{
                inputDisplay.text = String(0 - number)
                insertNumbers(plusMinusButton)
            }
            else if number > 0{
                inputDisplay.text = "-" + inputDisplay.text!
                insertNumbers(plusMinusButton)
            }
            else{
                return
            }
        }
        
    }
    @IBAction func clear(_ sender: Any) {
        clearDisplay()
        
    }
   
    func clearDisplay(){
        inputDisplay.text = ""
        outputDisplay.text = ""
        decimalButton.isEnabled = true
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
