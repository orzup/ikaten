import Quick
import Nimble

class RuleSpec: QuickSpec {
    override func spec() {
        var rule: Rule?

        beforeEach() {
            rule = Rule("ナワバリバトル")
        }

        describe("init") {
            it("") { expect(rule!.name).to(equal("ナワバリバトル")) }
        }

        describe("toStatInkKey") {
            it("") { expect(rule!.toStatInkKey()).to(equal("nawabari")) }
        }
    }
}
