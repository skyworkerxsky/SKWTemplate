import Foundation

struct Repo {
  let id: Int
  let name: String
}

extension Repo: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
  }
}

