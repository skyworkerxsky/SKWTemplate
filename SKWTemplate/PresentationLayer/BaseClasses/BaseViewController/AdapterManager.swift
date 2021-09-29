//
//  AdapterManager.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 21.09.2021.
//

import Foundation
import IGListKit

protocol AdapterCreator {
    func canDraw(this item: Any) -> Bool
    func createAdapter() -> ListSectionController
}

protocol Interactable: class {
    associatedtype Handler
    var handler: Handler? { get set }
}

class BaseAdapterCreator<V, T>: AdapterCreator where T: ListSectionController {
    func canDraw(this item: Any) -> Bool {
        return item is V
    }

    func createAdapter() -> ListSectionController {
        return T()
    }
}

final class AdapterManager {
    private let items: [AdapterCreator]

    init(items: [AdapterCreator]) {
        self.items = items
    }

    func adapter(from object: Any) -> ListSectionController {
        for item in items where item.canDraw(this: object) {
            return item.createAdapter()
        }
        fatalError("Please add missing AdapterCreator")
    }
}

class BaseInteractiveAdapterCreator<V, T>: BaseAdapterCreator<V, T>
    where T: ListSectionController & Interactable {
    typealias Adapter = T

    private var handler: Adapter.Handler?

    init(_ handler: Adapter.Handler? = nil) {
        self.handler = handler
    }

    override func createAdapter() -> ListSectionController {
        let result = Adapter()
        result.handler = self.handler
        return result
    }
}
