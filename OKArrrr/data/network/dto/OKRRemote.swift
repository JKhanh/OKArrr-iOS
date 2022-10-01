// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let oKRRemote = try? newJSONDecoder().decode(OKRResponse.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOKRRemote { response in
//     if let oKRRemote = response.result.value {
//       ...
//     }
//   }

import Foundation

// MARK: - OKRResponse
struct OKRResponse: Codable {
    let okrs: [OkrRemote]
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOkr { response in
//     if let okr = response.result.value {
//       ...
//     }
//   }

// MARK: - OkrRemote
struct OkrRemote: Codable {
    let objectiveID: Int
    let title, reason, mentor, type: String
    let progress: Int
    let dueDate, startDate: String

    enum CodingKeys: String, CodingKey {
        case objectiveID = "objectiveId"
        case title, reason, mentor, type, progress, dueDate, startDate
    }

    init(okr: OKR) {
        self.objectiveID = okr.id
        self.title = "okr.title"
        self.reason = "okr.reason"
        self.mentor = "okr.mentor"
        self.type = okr.type.rawValue
        self.progress = 0
        self.dueDate = "okr.dueDate"
        self.startDate = "okr.startDate"
    }
}
