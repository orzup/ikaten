import Quick
import Nimble

class StageSpec: QuickSpec {
    override func spec() {
        var stage: Stage?

        beforeEach() {
            stage = Stage("アロワナモール")
        }

        describe("init") {
            it("") { expect(stage!.name).to(equal("アロワナモール")) }
        }

        describe("toStatInkKey") {
            it("") { expect(stage!.toStatInkKey()).to(equal("arowana")) }
        }
    }
}
