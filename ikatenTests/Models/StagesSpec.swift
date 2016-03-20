import Quick
import Nimble

class StagesSpec: QuickSpec {
    override func spec() {
        var stages: Stages?

        beforeEach() {
            stages = Stages(data: [
                "maps": [
                    "アロワナモール",
                    "Bバスパーク"
                ]
            ])
        }

        describe("selectStage") {
            it("") {
                expect(stages!.selectStage(0).name).to(equal("アロワナモール"))
                expect(stages!.selectStage(1).name).to(equal("Bバスパーク"))
            }
        }
    }
}
