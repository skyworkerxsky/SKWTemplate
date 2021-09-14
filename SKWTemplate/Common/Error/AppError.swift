import Foundation

enum AppError {
  case unknown
  case with(message: String)
  
  init(message: String) {
    switch message {
    default: self = message.isEmpty ? .unknown : .with(message: message)
    }
  }
}

extension AppError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .unknown:
      return NSLocalizedString("unknown error", comment: "")
    case let .with(message):
      return NSLocalizedString("\(message)", comment: "")
    }
  }
}
