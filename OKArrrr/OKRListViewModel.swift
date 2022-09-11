//
//  OKRListViewModel.swift
//  OKArrrr
//
//  Created by Khanh jonas on 27/08/2022.
//

import Foundation
import RxSwift

class OKRListViewModel: ObservableObject {
    @Published var okrList: Observable<[OKR]>
    let repository: OKRRepository = OKRRepositoryImpl()
    
    init() {
        okrList = repository.getOKRist()
    }
}
