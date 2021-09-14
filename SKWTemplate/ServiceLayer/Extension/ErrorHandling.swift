import Foundation
import RxSwift
import Moya

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  func filterSuccess() -> Single<Response> {
    return flatMap { response -> Single<Response> in
      if 200 ... 299 ~= response.statusCode {
        return .just(response)
      }
      return self.parsingErrors(with: response)
    }
  }
  
  fileprivate func parsingErrors(with response: Response) -> Single<Response> {
    let model = try? JSONDecoder().decode(ErrorModel.self, from: response.data)
    if let errors = model?.message {
      return .error(AppError(message: errors))
    }
    return .error(AppError.unknown)
  }
}
