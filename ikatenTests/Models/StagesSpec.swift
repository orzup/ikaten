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
                expect(stages!.stageAtIndex(0).name).to(equal("アロワナモール"))
                expect(stages!.stageAtIndex(1).name).to(equal("Bバスパーク"))
            }
        }

        describe("firstStage") {
            it("") {
                expect(stages!.firstStage().name).to(equal("アロワナモール"))
            }
        }

        describe("secondStage") {
            it("") {
                expect(stages!.secondStage().name).to(equal("Bバスパーク"))
            }
        }
    }
}
