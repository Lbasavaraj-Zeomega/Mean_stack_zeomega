describe("A Recipe",function(){
    it("should exit",function(){
        expect(app.Models.Recipe).toBeDefined();
    })
    it('should have some default values',function(){
        var recipe=new app.Models.Recipe();
        expect(recipe.get('name')).toEqual('Basavaraj');
        expect(recipe.get('rating')).toEqual(5);
    })
})