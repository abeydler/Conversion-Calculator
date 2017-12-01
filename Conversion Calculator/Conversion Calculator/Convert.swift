//
//  Convert.swift
//  Conversion Calculator
//
//  Created by Austin Beydler on 11/29/17.
//  Copyright © 2017 Austin Beydler. All rights reserved.
//

import Foundation




    
func convertUnits(_ to: String, _ value: String) -> String{
    
    
    let value = Double(value)
    
    switch to {
    case "°C":
        let fah = Measurement(value: value!, unit: UnitTemperature.fahrenheit)
        let cel = fah.converted(to: .celsius)
        
        return String(cel.value)
    case "°F":
        let cel = Measurement(value: value!, unit: UnitTemperature.celsius)
        let fah = cel.converted(to: .fahrenheit)
        
        return String(fah.value)
        
    case "mi":
        let kil = Measurement(value: value!, unit: UnitLength.kilometers)
        let mil = kil.converted(to: .miles)
        
        return String(mil.value)
    case "km":
        let mil = Measurement(value: value!, unit: UnitLength.miles)
        let kil = mil.converted(to: .kilometers)
        
        return String(kil.value) 
    default:
         return "Error"
    }
        
        
    }





