import XCTest
@testable import NavigationDelegate

class LaunchViewControllerTests: XCTestCase {

    func testCallsShowRedWhenRedButtonTouched() {
        let viewController = loadLaunchViewController()
        let navigationDelegateSpy = LaunchViewControllerNavigationDelegateSpy()
        viewController.navigationDelegate = navigationDelegateSpy

        viewController.redButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(navigationDelegateSpy.showRedCalled)
    }

    func testCallsShowBlueWhenBlueButtonTouched() {
        let viewController = loadLaunchViewController()
        let navigationDelegateSpy = LaunchViewControllerNavigationDelegateSpy()
        viewController.navigationDelegate = navigationDelegateSpy

        viewController.blueButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(navigationDelegateSpy.showBlueCalled)
    }

    private func loadLaunchViewController() -> LaunchViewController {
        let viewController = LaunchViewController(nibName: "LaunchViewController", bundle: Bundle(for: LaunchViewController.self))
        viewController.beginAppearanceTransition(true, animated: false)
        return viewController
    }
}

class LaunchViewControllerNavigationDelegateSpy: LaunchViewControllerNavigationDelegate {

    private(set) var showRedCalled = false
    private(set) var showBlueCalled = false

    func showRedViewController() {
        showRedCalled = true
    }

    func showBlueViewController() {
        showBlueCalled = true
    }
}
