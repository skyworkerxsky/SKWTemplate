import Foundation

struct RepoModel {
  let id: Int
  let name: String
}

extension RepoModel: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
  }
}

