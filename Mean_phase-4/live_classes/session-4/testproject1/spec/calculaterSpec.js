class Calculatar
{
    add(a,b)
    {
        return a+b;
    }
    sub(a,b)
    {
        return a-b;
    }
    mul(a,b)
    {
        return a*b;
    }
    div(a,b){
        return a/b;
    }
}
describe('caluclatar Test', function(){
    var cal;
    beforeAll(function()
    {
        console.log('executed Before All specifications')
    })
    afterAll(function(){
        console.log('executed After All Specification')
    })
    beforeEach(function(){
      cal= new Calculatar();
    });
    afterEach(function(){
        cal=null;
    });
    it('should return Addition of a b',function(){
        console.log(cal.add(2,3));
        expect(cal.add(2,3)).toEqual(5);
    })
    it('should return Substraction  of a b',function(){
        console.log(cal.sub(2,3));
        expect(cal.sub(2,3)).toEqual(-1);
    })
    
    it('should return Multification  of a b',function(){
        console.log(cal.mul(2,3));
        expect(cal.mul(2,3)).toEqual(6);
    })
    it('should return Division  of a b',function(){
        console.log(cal.div(2,3));
        expect(cal.div(6,3)).toEqual(2);
    })
})