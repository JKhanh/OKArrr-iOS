import Alamofire
import Foundation

struct KeyResultService {
    static let instance = KeyResultService()
    let baseURL = "something.com"
    let keyResultPath = "/keyresult"

    func addKeyResult(keyResult: KeyResultRemote, completion: @escaping (KeyResultRemote) -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(keyResultPath)"

        let parameters: [String: Any] = [
            "objectiveId": keyResult.objectiveID,
            "title": keyResult.title,
            "progress": keyResult.progress,
            "step": keyResult.step,
            "mentor": keyResult.mentor,
            "dueDate": keyResult.dueDate,
            "startDate": keyResult.startDate
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseKeyResultRemote { response in
            if response.result.isSuccess {
                if let keyResult = response.result.value {
                    completion(keyResult)
                } else {
                    error("Add new key result failed")
                }
            } else {
                error("Add new key result failed")
            }
        }
    }

    func updateKeyResult(keyResult: KeyResultRemote, completion: @escaping () -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(keyResultPath)/\(keyResult.keyResultID)"

        let parameters: [String: Any] = [
            "keyresultID": keyResult.keyResultID,
            "objectiveId": keyResult.objectiveID,
            "title": keyResult.title,
            "step": keyResult.step,
            "mentor": keyResult.mentor,
            "progress": keyResult.progress,
            "dueDate": keyResult.dueDate,
            "startDate": keyResult.startDate
        ]
        Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                completion()
            } else {
                error("Update key result failed")
            }
        }
    }

    func deleteKeyResult(keyResult: KeyResultRemote, completion: @escaping () -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(keyResultPath)/\(keyResult.keyResultID)"

        Alamofire.request(url, method: .delete).responseJSON { (response) in
            if response.result.isSuccess {
                completion()
            } else {
                error("Delete key result failed")
            }
        }
    }
    
    func getKeyResultList(_ okr: OKR) -> Result<[KeyResult]> {
        let url = "\(baseURL)/\(okr.id)/keyresults"
        Alamofire.request(url).responseKeyResultRemote { (response) in
            guard let keyResultResponse = response.result.value else {
                return Result.failure(OKRError.invalidResponse)
            }
            return Result.success(keyResultResponse.keyResults)
        }
    }
}