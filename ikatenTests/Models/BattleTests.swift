import XCTest

class BattleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateBattle() {
        let battle = Battle(data:
            [
            "lobby": "standard",
            "rule": "area",
            "weapon": "wakaba",
            "rank": "s",
            "rank_exp": 50
            ])

        battle.setResult([
            "map":           "arowana",
            "is_win":        false,
            "kill":          12,
            "death":         5,
            "rankExpChange": 6,
            "knock_out":      false
            ])

        XCTAssertEqual(battle.lobby, "standard")
        XCTAssertEqual(battle.rule, "area")
        XCTAssertEqual(battle.weapon, "wakaba")
        XCTAssertEqual(battle.rank, "s")
        XCTAssertEqual(battle.rankExp, 50)
        XCTAssertEqual(battle.map, "arowana")
        XCTAssertEqual(battle.rankAfter, "s")
        XCTAssertEqual(battle.rankExpAfter, 56)
        XCTAssertEqual(battle.isWin, true)
        XCTAssertEqual(battle.kill, 12)
        XCTAssertEqual(battle.death, 5)
        XCTAssertEqual(battle.knockOut, false)

        // 勝ってランクが上がった時のテスト
        battle.setResult([
            "map":           "arowana",
            "is_win":        false,
            "kill":          12,
            "death":         5,
            "rankExpChange": 50,
            "knock_out":      false
            ])

        XCTAssertEqual(battle.rankAfter, "s+")
        XCTAssertEqual(battle.rankExpAfter, 30)

        // 負けてランクが下がった時のテスト
        battle.setResult([
            "map":           "arowana",
            "is_win":        true,
            "kill":          12,
            "death":         5,
            "rankExpChange": 51,
            "knock_out":      false
            ])

        XCTAssertEqual(battle.rankAfter, "a+")
        XCTAssertEqual(battle.rankExpAfter, 70)
    }
    
    func testPerformanceExample() {
        self.measureBlock {
        }
    }
    
}
