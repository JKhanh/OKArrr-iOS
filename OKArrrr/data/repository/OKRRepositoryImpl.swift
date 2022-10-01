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
    let okrService = OKRService.instance

    func addOKR(okr: OKR, didAdd: @escaping () -> Void) {
        let okrRemote = OkrRemote(okr: okr)
        okrService.postOKR(okr: okrRemote, completion: {
            let okrLocal = OKRLocal.mapToLocal(okr: okrRemote)
            database.addOKR(okr: okrLocal, didAdd: didAdd)
        }, error: { error in
            print(error)
        })
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
        okrService.getOKRList { okrList in
            let okrLocalList = okrList.okrs.map { okrRemote in
                OKRLocal.mapToLocal(okr: okrRemote)
            }
            okrLocalList.forEach { okrLocal in
                database.addOKR(okr: okrLocal, didAdd: {})
            }
        } error: { error in
            print(error)
        }

        return Observable.collection(from: database.getOKRList())
            .map { okrLocals in
                Array(okrLocals).map { $0.mapToDomain() }
            }
    }
}
