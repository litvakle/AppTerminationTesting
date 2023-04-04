//
//  AppTerminationTestingTests.swift
//  AppTerminationTestingTests
//
//  Created by Lev Litvak on 04.04.2023.
//

import XCTest
@testable import AppTerminationTesting

final class AppTerminationTestingTests: XCTestCase {
    func test_onAppTerminate_requestsLoader() {
        let loader = LoaderSpy()
        let sut = ContentView(loader: loader)
        expectation(forNotification: UIApplication.willTerminateNotification, object: nil)
        
        NotificationCenter.default.post(Notification(name: UIApplication.willTerminateNotification))
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(loader.loadCallCount, 1)
    }
    
    // MARK: - Helpers
    
    private class LoaderSpy: Loader {
        var loadCallCount = 0
        
        func load() {
            loadCallCount += 1
            print("Spy loading")
        }
    }
}
