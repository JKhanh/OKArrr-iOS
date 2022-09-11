//
//  OKRRepositoryImpl.swift
//  OKArrrr
//
//  Created by Khanh jonas on 27/08/2022.
//

import Foundation
import RxSwift
import RxRealm

struct OKRRepositoryImpl: OKRRepository {
    let database = OKRDatabase()

    func addOKR(okr: OKR, didAdd: @escaping () -> Void) {
        let okrLocal = OKRLocal.mapToLocal(okr: okr)
        database.addOKR(okr: okrLocal, didAdd: didAdd)
    }
    	
    func updateOKR(okr: OKR, didUpdate: @escaping () -> Void) {
        let okrLocal = OKRLocal.mapToLocal(okr: okr)
        database.updateOKR(okr: okrLocal, didUpdate: didUpdate)
    }
    
    func deleteOKR(okr: OKR, didDelete: @escaping () -> Void) {
        let okrLocal = OKRLocal.mapToLocal(okr: okr)
        database.deleteOKR(okr: okrLocal, didDelete: didDelete)
    }
    
    func getOKRist() -> Observable<[OKR]> {
        return Observable.collection(from: database.getOKRList())
            .map { okrLocals in
                Array(okrLocals).map { $0.mapToDomain() }
            }
    }
}
