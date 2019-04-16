import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        // You _can_ do this with a Storyboard too.
        let launchViewController = LaunchViewController(nibName: "LaunchViewController", bundle: .main)
        launchViewController.title = "👩‍✈️"
        launchViewController.navigationDelegate = self

        navigationController = UINavigationController(rootViewController: launchViewController)

        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate: LaunchViewControllerNavigationDelegate {

    func showRedViewController() {
        let redViewController = ColoredViewController()
        redViewController.color = .red
        navigationController?.pushViewController(redViewController, animated: true)
    }

    func showBlueViewController() {
        let blueViewController = ColoredViewController()
        blueViewController.color = .blue

        blueViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Dismiss",
            style: .plain,
            target: self,
            action: #selector(dismiss)
        )
        navigationController?.present(
            UINavigationController(rootViewController: blueViewController),
            animated: true,
            completion: .none
        )
    }

    @objc func dismiss() {
        navigationController?.dismiss(animated: true, completion: .none)
    }
}
