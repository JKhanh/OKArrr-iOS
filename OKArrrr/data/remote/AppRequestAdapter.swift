import Alamofire

class AppRequestAdapter: RequestAdapter {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?, _ refreshToken: String?) -> Void

    private let lock = NSLock()

    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    var accessToken: String? = nil
    var refreshToken: String? = nil
    static let shared = AppRequestAdapter()

    private init() {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.adapter = self
        sessionManager.retrier = self
    }
    

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        if let urlString = urlRequest.url?.absoluteString, urlString.contains(BASE_URL), !urlString.hasSuffix("/auth/login") {
            if let accessToken = accessToken {
                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            }
        }
        return urlRequest
    }

    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }

        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)

            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken, refreshToken in
                    guard let strongSelf = self else { return }

                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }

                    if let accessToken = accessToken, let refreshToken = refreshToken {
                        strongSelf.accessToken = accessToken
                        strongSelf.refreshToken = refreshToken
                    }

                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }

    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }

        isRefreshing = true

        let parameters: Parameters = [
            "refreshToken": refreshToken ?? ""
        ]

        Alamofire.request("\(BASE_URL)/auth/refresh", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { [weak self] response in
            guard let strongSelf = self else { return }

            if let json = response.result.value as? [String: Any], let accessToken = json["accessToken"] as? String, let refreshToken = json["refreshToken"] as? String {
                completion(true, accessToken, refreshToken)
            } else {
                completion(false, nil, nil)
            }

            strongSelf.isRefreshing = false
        }
    }
}