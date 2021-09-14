import Foundation

struct ErrorModel {
  let message: String
  let documentation: String
}

extension ErrorModel: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case message
    case documentation = "documentation_url"
  }
}
