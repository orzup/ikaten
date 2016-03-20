import Quick
import Nimble

class RuleSpec: QuickSpec {
    override func spec() {
        var rule: Rule?

        beforeEach() {
            rule = Rule("ナワバリバトル")
        }

        describe("init") {
            it("初期化できること") {
                expect(rule!.name).to(equal("ナワバリバトル"))
            }
        }

        describe("toStatInkKey") {
            it("stat.ink用のキーに変換できること") {
                expect(rule!.toStatInkKey()).to(equal("nawabari"))
            }
        }
    }
}
