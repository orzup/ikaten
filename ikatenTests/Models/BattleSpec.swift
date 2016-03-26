import Quick
import Nimble

class BattleSpec: QuickSpec {
    override func spec() {
        beforeEach() {
            let battle = Battle(data:[
                "lobby":    Lobby("ガチマッチ"),
                "rule":     Rule("ガチエリア"),
                "weapon":   Weapon(["key": "52gal" ,"name": ["ja_JP": ".52ガロン"]]),
                "rank":     Udemae("s", 50)
                ])
        }

        describe("init") {
            it("初期化できること") {
                expect(battle.lobby.name).to(equal("ガチマッチ"))
                expect(battle.rule.name).to(equal("ガチエリア"))
                expect(battle.weapon.name).to(equal(".52ガロン"))
                expect(battle.udemae.rank).to(equal("s"))
                expect(battle.udemae.exp).to(equal(50))
            }
        }

        describe("setResult") {
            let params : Dictionary<String, AnyObject> = [
                "map":           Stage(["key": "arowana" ,"name": ["ja_JP": "アロワナモール"]]),
                "is_win":        true,
                "kill":          12,
                "death":         5,
                "rankExpChange": 6,
                "knock_out":     false
            ]

            it("結果をセットできること") {
                battle.setResult(params)
                expect(battle.map.name).to(equal("アロワナモール"))
                expect(battle.isWin).to(beTruthy())
                expect(battle.kill).to(equal(12))
                expect(battle.kill).to(equal(5))
                expect(battle.udemaeAfter.rank).to(equal("s"))
                expect(battle.udemaeAfter.exp).to(equal(50))
                expect(battle.knockOut).to(beFalsey())
            }
        }
    }
}
