import Foudation
import Alamorfire

struct OKRService {
    static let instance = OKRService()
    let baseURL = "something.com"
    let objectivePath = "/objective"
    
    func postOKR(okr: OKRRemote, completion: @escaping () -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(objectivePath)"
        
        let parameters: [String: Any] = [
            "objectiveId": okr.objectiveID,
            "title": okr.title,
            "reason": okr.reason,
            "mentor": okr.mentor,
            "type": okr.type,
            "progress": okr.progress,
            "dueDate": okr.dueDate,
            "startDate": okr.startDate
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                completion()
            } else {
                error("Add new OKR failed")
            }
        }
    }   

    func updateOKR(okr: OKRRemote, completion: @escaping () -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(objectivePath)/\(okr.objectiveID)"
        
        let parameters: [String: Any] = [
            "objectiveId": okr.objectiveID,
            "title": okr.title,
            "reason": okr.reason,
            "mentor": okr.mentor,
            "type": okr.type,
            "progress": okr.progress,
            "dueDate": okr.dueDate,
            "startDate": okr.startDate
        ]
        Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                completion()
            } else {
                error("Update OKR failed")
            }
        }
    }

    func deleteOKR(okr: OKRRemote, completion: @escaping () -> Void, error: @escaping (String) -> Void) {
        let url = "\(baseURL)\(objectivePath)/\(okr.objectiveID)"
        
        Alamofire.request(url, method: .delete).responseJSON { (response) in
            if response.result.isSuccess {
                completion()
            } else {
                error("Delete OKR failed")
            }
        }
    }

    func getOKRList() -> Result<[OKR]> {
        let url = "\(baseURL)\(objectivePath)"
        Alamofire.request(url).responseOKRRemote { (response) in
            guard let oKRResponse = response.result.value else {
                return Result.failure(OKRError.invalidResponse)
            }
            return Result.success(oKRResponse.okrs)
        }
    }
}