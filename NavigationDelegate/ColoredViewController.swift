import UIKit

class ColoredViewController: UIViewController {

    var color: UIColor = .white {
        didSet {
            view.backgroundColor = color
        }
    }
}
