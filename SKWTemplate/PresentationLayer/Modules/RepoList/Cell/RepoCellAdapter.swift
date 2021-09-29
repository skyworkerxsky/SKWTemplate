import IGListKit
import UIKit

public typealias Action<T> = (T) -> Void

final class RepoCellAdapterCreator: BaseInteractiveAdapterCreator<RepoModel, RepoCellAdapter> {}

struct RepoCellAdapterHandler {
    let select: Action<RepoModel>?
}

public final class RepoCellAdapter: ListSectionController, Interactable {
    typealias Handler = RepoCellAdapterHandler
    var handler: Handler?

    private var item: RepoModel!
    private var size: CGSize = .zero

    public override func sizeForItem(at index: Int) -> CGSize {
        return size
    }

    public override func cellForItem(at index: Int) -> UICollectionViewCell {
      let cell = collectionContext?.dequeueReusableCell(of: RepoCell.self,
                                                        for: self, at: index) as? RepoCell
//        cell?.configure(item)
        return cell!
    }

    public override func didUpdate(to object: Any) {
        item = object as? RepoModel
        let width: CGFloat = collectionContext!.containerSize.width
        let height: CGFloat = self|.template
            .configure(item)
            .layout()
        size = CGSize(width: width, height: height)
    }

    public override func didSelectItem(at index: Int) {
        handler?.select?(item)
    }
}

