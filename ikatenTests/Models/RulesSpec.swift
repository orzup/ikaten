import Quick
import Nimble

class RulesSpec: QuickSpec {
    override func spec() {
        var rules: Rules?

        beforeEach() {
            rules = Rules(
                [
                    ["key": "nawabari", "name": ["ja_JP": "ナワバリバトル"]],
                    ["key": "area", "name": ["ja_JP": "ガチエリア"]]
                ]
            )
        }

        describe("init") {
            it("初期化できること") {
                expect(rules!.nameAtIndex(1)).to(equal("ガチエリア"))
            }
        }
    }
}
