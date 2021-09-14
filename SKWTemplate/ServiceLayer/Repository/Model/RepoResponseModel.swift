import Foundation

struct RepoResponseModel {
  let totalCount: Int
  let items: [RepoModel]
}

extension RepoResponseModel: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items
  }
}
