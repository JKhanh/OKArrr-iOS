//
//  OKR.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import Foundation

class OKR: Codable, Identifiable {
    var name: String
    var dueDate: Date
    var reason: String
    var type: OKRType
    var dueDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: dueDate)
    }
    
    init(name: String, dueDate: Date, reason: String, type: OKRType) {
        self.name = name
        self.dueDate = dueDate
        self.reason = reason
        self.type = type
    }
}

extension OKR {
    enum OKRType: String, Codable {
        case commit = "Commit"
        case insprite = "Insprite"
    }
}
