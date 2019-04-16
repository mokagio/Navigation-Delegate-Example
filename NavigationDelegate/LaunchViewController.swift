import UIKit

protocol LaunchViewControllerNavigationDelegate: class {
    func showRedViewController()
    func showBlueViewController()
}

class LaunchViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!

    weak var navigationDelegate: LaunchViewControllerNavigationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        redButton.addTarget(self, action: #selector(redButtonTouched), for: .primaryActionTriggered)
        blueButton.addTarget(self, action: #selector(blueButtonTouched), for: .primaryActionTriggered)
    }

    @objc func redButtonTouched() {
        navigationDelegate?.showRedViewController()
    }

    @objc func blueButtonTouched() {
        navigationDelegate?.showBlueViewController()
    }
}
