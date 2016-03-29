import Quick
import Nimble

class RuleSpec: QuickSpec {
    override func spec() {
        var rule: Rule?

        beforeEach() {
            rule = Rule([
                "key": "area" ,
                "name": ["ja_JP": "ガチエリア"]
                ])
        }

        describe("init") {
            it("初期化できること") {
                expect(rule!.name).to(equal("ガチエリア"))
            }
        }
    }
}
