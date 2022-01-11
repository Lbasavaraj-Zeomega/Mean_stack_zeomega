describe("get Nth Element",function(){
    it("sholud be defined",function(){
        expect(window.getNthElement).toBeDefined();
    })
    it("sholud retrun Nth Element",function(){
        var result=getNthElement([12,89,56,46],2);
        expect(result).toBe(56);
    })
    it("Add function sholud be defined",function(){
        expect(window.add).toBeDefined();
        expect(add(3,6)).toBe(9);
    })
})