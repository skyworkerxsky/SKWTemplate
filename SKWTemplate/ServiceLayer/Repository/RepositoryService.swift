import Foundation
import Moya

public enum RepositoryService {
  case repositories
}

extension RepositoryService: TargetType {
  public var baseURL: URL {
    return URL(string: "https://api.github.com/search")!
  }
  
  // https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc&page=2&per_page=15
  
  public var path: String {
    switch self {
    case .repositories:
      return "/repositories"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .repositories:
      return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  private var parameters: [String: String] {
    return ["q": "language:swift",
            "sort": "stars",
            "order": "desc",
            "page": "1",
            "per_page": "15"]
  }
  
  public var task: Task {
    switch self {
    case .repositories:
      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }
  
  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
}
