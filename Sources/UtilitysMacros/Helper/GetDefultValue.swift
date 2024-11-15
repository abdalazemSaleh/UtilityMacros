//
//  File.swift
//  Utilitys
//
//  Created by Abdalazem Saleh on 15/11/2024.
//

import Foundation

public func getDefultValue(_ type: String?) -> Any {
    switch type {
    case "String?":
        return "\"NotFound\""
    case "Int?":
        return 0
        case "Double?":
        return 0.0
    case "Float?":
        return 0.0
    case "Bool?":
        return false
    default:
        return "Not Founded"
    }
}
