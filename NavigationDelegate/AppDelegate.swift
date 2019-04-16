import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        // You _can_ do this with a Storyboard too.
        let launchViewController = LaunchViewController(nibName: "LaunchViewController", bundle: .main)
        launchViewController.title = "👩‍✈️"
        let navigator = UINavigationController(rootViewController: launchViewController)

        window?.rootViewController = navigator

        window?.makeKeyAndVisible()

        return true
    }
}
