//
//  OKRLocal.swift
//  OKArrrr
//
//  Created by Khanh jonas on 27/08/2022.
//

import Foundation
import RealmSwift

class OKRLocal: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var objective: String
    @Persisted var reason: String
    @Persisted var mentor: String
    @Persisted var startDate: Date
    @Persisted var dueDate: Date
    private dynamic var privateType = OKR.OKRType.commit.rawValue
    var type: OKR.OKRType {
        get {
            return OKR.OKRType(rawValue: privateType)!
        }
        set {
            privateType = newValue.rawValue
        }
    }
    
    convenience init(_ objective: String, _ startDate: Date, _ dueDate: Date, _ reason: String, _ okrType: OKR.OKRType, _ mentor: String) {
        self.init()
        self.objective = objective
        self.startDate = startDate
        self.dueDate = dueDate
        self.reason = reason
        self.type = okrType
        self.mentor = mentor
    }
    
    static func mapToLocal(okr: OKR) -> OKRLocal {
        return OKRLocal(okr.objective, okr.startDate, okr.dueDate, okr.reason, okr.type, okr.mentor)
    }

    static func mapToLocal(okr: OkrRemote) -> OKRLocal {
        return OKRLocal(okr.title, DateFormatter().date(from: okr.startDate)!, DateFormatter().date(from: okr.dueDate)!, okr.reason, OKR.OKRType(rawValue: okr.type) ?? .commit, okr.mentor)
    }
    
    func mapToDomain() -> OKR {
        return OKR(id: id.hashValue, name: objective, startDate: startDate, dueDate: dueDate, reason: reason, type: type, mentor: mentor)
    }
}
