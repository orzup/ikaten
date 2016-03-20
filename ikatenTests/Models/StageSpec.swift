import Quick
import Nimble

class StageSpec: QuickSpec {
    override func spec() {
        var stage: Stage?

        beforeEach() {
            stage = Stage("アロワナモール")
        }

        describe("init") {
            it("初期化できること") {
                expect(stage!.name).to(equal("アロワナモール"))
            }
        }

        describe("toStatInkKey") {
            it("stat.ink用のキーに変換できること") {
                expect(stage!.toStatInkKey()).to(equal("arowana"))
            }
        }
    }
}
