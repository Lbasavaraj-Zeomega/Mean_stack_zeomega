describe("A page with backbone",function(){
    it ('it should have access to underscore',function(){
        expect(window._).toBeDefined();
        expect(window._.VERSION).toBeDefined();
    })
    it ('it should have access to backBone',function(){
        expect(window.Backbone).toBeDefined();
        expect(window.Backbone.Model).toBeDefined();

        expect(window.Backbone.Collection).toBeDefined();
        expect(window.Backbone.View).toBeDefined();
    })
 })
// describe('A page with backbone',function(){
//     it ('it should have access to underscore',function(){
//         expect(window._).toBeDefined();
//         expect(window._.VERSION).toBeDefined();
//     })
// }) 