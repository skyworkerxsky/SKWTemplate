import Foundation

public struct RepoModel {
  let id: Int
  let name: String
  let url: String
}

extension RepoModel: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case url = "html_url"
  }
}

