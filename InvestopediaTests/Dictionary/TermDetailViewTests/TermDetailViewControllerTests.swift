//
//  TermDetailViewControllerTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import XCTest
@testable import Investopedia

class TermDetailViewControllerTests: XCTestCase {
    var viewController: TermDetailViewController!
    var viewModelMock: TermDetailViewModelMock!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "TermDetailViewController") as? TermDetailViewController
        viewModelMock = TermDetailViewModelMock()
        viewController.viewModel = viewModelMock
        viewController.loadViewIfNeeded()
    }

    // MARK: - Tests for IBActions

    func testPreviousButtonTapped() {

        // When
        viewController.previousButtonTapped(UIButton())

        // Then
        XCTAssertTrue(viewModelMock.selectPreviousTermCalled)
    }

    func testNextButtonTapped() {
        // When
        viewController.nextButtonTapped(UIButton())

        // Then
        XCTAssertTrue(viewModelMock.selectNextTermCalled)
    }

    // MARK: - Other Tests for the ViewController

    override func tearDown() {
        viewController = nil
        viewModelMock = nil
        super.tearDown()
    }
}
