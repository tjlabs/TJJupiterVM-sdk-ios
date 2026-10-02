import XCTest
@testable import TJJupiterVMSDK
import TJLabsJupiter
import TJLabsJupiterVM

final class WrapperConversionTests: XCTestCase {
    func testInvalidSectorCodesAreWrapped() {
        XCTAssertEqual(TJLabsJupiter.JupiterErrorCode.INVALID_SECTOR.toWrap(), .INVALID_SECTOR)
        XCTAssertEqual(TJLabsJupiterVM.VMErrorCode.INVALID_SECTOR.toWrap(), .INVALID_SECTOR)
    }

    func testJupiterResultKeepsRemainingDistance() {
        let result = TJLabsJupiter.JupiterResult(
            mobile_time: 1, index: 2, building_name: "B", level_name: "L",
            jupiter_pos: TJLabsJupiter.Position(x: 1, y: 2, heading: 3),
            remaining_distance: 365,
            velocity: 0, is_vehicle: true, is_indoor: true, validity_flag: 1
        )
        XCTAssertEqual(result.toWrap().remaining_distance, 365)
    }

    func testEnteringInfoFieldsArePublic() throws {
        let json = #"{ "id": 1, "number": 2, "name": "Gate A" }"#
        let info = try JSONDecoder().decode(TJLabsJupiterVM.EnteringInfo.self, from: Data(json.utf8)).toWrap()
        XCTAssertEqual(info.id, 1)
        XCTAssertEqual(info.number, 2)
        XCTAssertEqual(info.name, "Gate A")
    }
}

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
