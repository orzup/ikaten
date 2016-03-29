import Quick
import Nimble

class DataCollectionSpec: QuickSpec {
    override func spec() {
        var dataCollection: DataCollection?

        beforeEach() {
            dataCollection = DataCollection()
            dataCollection!.append(Data(["key": "key1", "name": ["ja_JP": "キー1"]]))
            dataCollection!.append(Data(["key": "key2", "name": ["ja_JP": "キー2"]]))
        }

        describe("all") {
            it("要素を全て取得すること") {
                expect(dataCollection!.all().count).to(equal(2))
            }
        }

        describe("count") {
            it("要素数を取得すること") {
                expect(dataCollection!.count()).to(equal(2))
            }
        }

        describe("dataAtIndex") {
            it("indexでdataが取れること") {
                expect(dataCollection!.dataAtIndex(1)).to(beTruthy())
            }
        }

        describe("nameAtIndex") {
            it("indexでnameが取れること") {
                expect(dataCollection!.nameAtIndex(0)).to(equal("キー1"))
            }
        }

        describe("indexOf") {
            it("nameで検索してDataを返すこと") {
                expect(dataCollection!.indexOf("キー2")).to(beTruthy())
            }
        }

        describe("find") {
            it("keyで検索して場所を返すこと") {
                expect(dataCollection!.find("key2")).to(equal(1))
            }
        }
    }
}
