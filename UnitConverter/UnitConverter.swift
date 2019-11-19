//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Denis Calixto on 9/30/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

enum TemperatureUnitType {
    case celsius
    case farenheit
}

class UnitConverter {
    
    func temperatureString(for int: Int, unitType: TemperatureUnitType) -> String {
        switch unitType {
        case .celsius:
            return "\(degreesCelsius(degreesFarenheit: int))"
        case .farenheit:
            return "\(degreesFarenheit(degreeCelsius: int))"
        }
    }
    
    func degreesFarenheit(degreeCelsius: Int) -> Int {
        return Int(1.8 * Float(degreeCelsius) + 32)
    }
    
    func degreesCelsius(degreesFarenheit: Int) -> Int {
        return Int( (Float(degreesFarenheit) - 32) / 1.8 )
    }
}
