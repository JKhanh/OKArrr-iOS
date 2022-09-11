//
//  OKRRepository.swift
//  OKArrrr
//
//  Created by Khanh jonas on 27/08/2022.
//

import Foundation
import RxSwift

protocol OKRRepository {
    func addOKR(okr: OKR, didAdd: @escaping () -> Void)
    func updateOKR(okr: OKR, didUpdate: @escaping () -> Void)
    func deleteOKR(okr: OKR, didDelete: @escaping () -> Void)
    func getOKRist() -> Observable<[OKR]>
}
