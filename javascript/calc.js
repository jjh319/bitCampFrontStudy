// 빈 객체로 생성
var calc = {}

// 멤버변수 추가
calc.x = 0;
calc.y = 0;

// 멤버함수
calc.setValue = function(x,y) {
    this.x = x;
    this.y = y;
} // setValue

calc.plus = function() {
    return this.x + this.y;
}

calc.minus = function() {
    return this.x - this.y;
}

calc.result = function() {
    var sum = calc.plus();
    var sub = calc.minus();

    document.write("덧셈 = " + sum + "<br>");
    document.write("뺄셈 = " + sub + "<br>");
}