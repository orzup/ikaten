import Quick
import Nimble

class BattleSpec: QuickSpec {
    override func spec() {
        describe("バトルの成績をセット") {
            let battle = Battle(data:[
                    "lobby":    Lobby("レギュラーマッチ"),
                    "rule":     Rule(["key": "hoko" ,"name": ["ja_JP": "ガチホコ"]]),
                    "weapon":   Weapon(["key": "52gal" ,"name": ["ja_JP": "52ガロン"]]),
                    "rank":     "s",
                    "rank_exp": 50
                ])

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
                battle!.setResult(params)
                expect(battle!.map.name).to(equal("アロワナモール"))
                expect(battle!.isWin).to(beTrue())
                expect(battle!.kill).to(equal(12))
                expect(battle!.death).to(equal(5))
                expect(battle!.udemaeAfter.rank).to(equal("S"))
                expect(battle!.udemaeAfter.exp).to(equal(56))
                expect(battle!.knockOut).to(beFalse())
            }
        }
    }
}
