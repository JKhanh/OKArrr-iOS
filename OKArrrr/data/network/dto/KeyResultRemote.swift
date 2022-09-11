// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let keyResultRemote = try? newJSONDecoder().decode(KeyResultRemote.self, from: jsonData)

import Foundation

// MARK: - KeyResultRemote
struct KeyResultRemote: Codable {
    let keyResultID, progress: Int
    let title, step, mentor, startDate: String
    let dueDate: String
    let objectiveID: Int

    enum CodingKeys: String, CodingKey {
        case keyResultID = "keyResultId"
        case progress, title, step, mentor, startDate, dueDate
        case objectiveID = "objectiveId"
    }
}