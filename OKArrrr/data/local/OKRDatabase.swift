//
//  OKRDatabase.swift
//  OKArrrr
//
//  Created by Khanh jonas on 27/08/2022.
//

import Foundation
import RealmSwift
import UIKit

struct OKRDatabase{
    let db = try! Realm()
    
    func addOKR(okr: OKRLocal, didAdd: @escaping () -> Void) {
        do {
            try db.write({
                db.add(okr)
            })
            didAdd()
        } catch {
            print(error)
        }
    }
    
    func updateOKR(okr: OKRLocal, didUpdate: @escaping () -> Void) {
        do {
            try db.write({
                db.add(okr, update: .modified)
            })
            didUpdate()
        } catch {
            print(error)
        }
    }
    
    func deleteOKR(okr: OKRLocal, didDelete: @escaping () -> Void) {
        do {
            try db.write({
                db.delete(okr)
            })
            didDelete()
        } catch {
            print(error)
        }
    }
    
    func getOKRList() -> Results<OKRLocal> {
        return db.objects(OKRLocal.self)
    }
}
