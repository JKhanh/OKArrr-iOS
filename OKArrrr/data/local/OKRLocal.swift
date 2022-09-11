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
    @Persisted var name: String
    @Persisted var dueDate: Date
    @Persisted var reason: String
    private dynamic var privateType = OKR.OKRType.commit.rawValue
    var type: OKR.OKRType {
        get {
            return OKR.OKRType(rawValue: privateType)!
        }
        set {
            privateType = newValue.rawValue
        }
    }
    
    convenience init(_ name: String, _ dueDate: Date, _ reason: String, _ okrType: OKR.OKRType) {
        self.init()
        self.name = name
        self.dueDate = dueDate
        self.reason = reason
        self.type = okrType
    }
    
    static func mapToLocal(okr: OKR) -> OKRLocal {
        return OKRLocal(okr.name, okr.dueDate, okr.reason, okr.type)
    }
    
    func mapToDomain() -> OKR {
        return OKR(id: _id.hashValue,
                   name: name,
                   dueDate: dueDate,
                   reason: reason,
                   type: type)
    }
}
