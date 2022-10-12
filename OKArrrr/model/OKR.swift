//
//  OKR.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import Foundation

class OKR: Codable, Identifiable {
    var id = 0
    var objective, reason, mentor: String
    var dueDate, startDate: Date
    var type: OKRType
    var progress: Float = 0
    var dueDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: dueDate)
    }
    var keyResults = [KeyResultRemote]()
    
    init(name: String, startDate: Date, dueDate: Date, reason: String, type: OKRType, mentor: String) {
        self.objective = name
        self.startDate = startDate
        self.dueDate = dueDate
        self.reason = reason
        self.type = type
        self.mentor = mentor
    }
    
    init(id: Int,name: String, startDate: Date, dueDate: Date, reason: String, type: OKRType, mentor: String) {
        self.id = id
        self.objective = name
        self.startDate = startDate
        self.dueDate = dueDate
        self.reason = reason
        self.type = type
        self.mentor = mentor
    }
}

extension OKR {
    enum OKRType: String, Codable {
        case commit = "Commit"
        case insprite = "Insprite"
    }
}
