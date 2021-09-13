import Foundation

struct ErrorRepos {
  let message: String
  let documentation: String
}

extension ErrorRepos: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case message
    case documentation = "documentation_url"
  }
}
