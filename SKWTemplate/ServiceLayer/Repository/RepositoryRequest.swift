import Foundation
import Moya

public enum RepositoryRequest {
  case repositories
}

extension RepositoryRequest: TargetType {
  public var baseURL: URL {
    return URL(string: "https://api.github.com/search")!
  }
  
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
    let path = Bundle.main.path(forResource: "samples", ofType: "json")!
    return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
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
