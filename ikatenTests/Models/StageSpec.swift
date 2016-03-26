import Quick
import Nimble

class StageSpec: QuickSpec {
    override func spec() {
        var stage: Stage?

        beforeEach() {
            stage = Stage([
                "key": "arowana" ,
                "name": ["ja_JP": "アロワナモール"]
                ])
        }

        describe("init") {
            it("初期化できること") {
                expect(stage!.name).to(equal("アロワナモール"))
            }
        }
    }
}
