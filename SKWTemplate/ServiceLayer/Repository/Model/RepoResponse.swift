import Foundation

struct RepoResponse {
  let totalCount: Int
  let items: [Repo]
}

extension RepoResponse: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items
  }
}
