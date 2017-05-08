/**
 * Created by calee0219 on 11/1/16.
 */

/// <reference path="jquery.d.ts" />

enum State { Init, Num, Opt, Dot }
enum Mode { Hex, Dec, Oct, Bin }

var str: string = "";
var ans: string = "";
var buff: string = "0";
var sta: State = State.Init;
var mode: Mode = Mode.Dec;
var isDiv: boolean = false;
var checkNum = new RegExp('[0123456789ABCDEF]');

function init() {
  isDiv = false;
  str = "";
  ans = "";
  buff = "0";
  sta = State.Init;
}

function numToQue() {
  var tmpStr: string = $(this).text();
  if(sta === State.Init) {
    str = "";
    ans = "";
    buff = "";
  }
  if(buff === "0") buff = tmpStr;
  else if(buff === "-0") buff = "-"+tmpStr;
  else buff += tmpStr;
  sta = State.Num;
  display();
}

function optToQue() {
  var tmpStr: string = $(this).text();
  var tmpOpt: string = $(this).attr('id');
  var opt: string = checkOpt(tmpOpt);
  isDiv = (opt === "/");
  if(sta === State.Init || eval(toDec(buff)) === 0) {
    if(eval(toDec(buff)) !== 0) {
      str = buff + tmpStr;
      ans = toDec(buff) + opt;
      sta = State.Opt;
      buff = "0";
    } else if(tmpOpt === "minu") {
      plusMin();
    }
  } else if(sta === State.Num) {
    str += buff + tmpStr;
    ans += toDec(buff) + opt;
    sta = State.Opt;
    buff = "0";
  } else if(sta === State.Opt) {
    str = str.slice(0,-1) + tmpStr;
    ans = ans.slice(0,-1) + opt;
    sta = State.Opt;
    buff = "0";
  }
  display();
}

function toDec(num: string): string {
  return cType(num,mode,Mode.Dec);
}

function checkOpt(opt: string): string {
  if(opt === 'plus') return '+';
  if(opt === 'minu') return '-';
  if(opt === 'muti') return '*';
  if(opt === 'divi') return '/';
  if(opt === 'modu') return '%';
}

function head(mo: Mode) {
  if(mo === Mode.Bin) return "0b";
  if(mo === Mode.Oct) return "0o";
  if(mo === Mode.Dec) return "";
  if(mo === Mode.Hex) return "0x";
}

function plusMin() {
  if (buff.substr(0,1) === "-") buff = buff.substr(1, buff.length);
  else buff = "-" + buff;
  sta = State.Num;
  display();
}

function clear() {
  init();
  display();
}

function clearNum() {
  while(sta === State.Num || sta === State.Dot) backspace();
}

function equal() {
  if(isDiv && eval(toDec(buff)) === 0) Err();

  buff = cType(operate(),Mode.Dec,mode);
  ans = "";
  str = "";
  isDiv = false;
  sta = State.Init;
  display();
}

function operate(): string {
  var tmpAns: string = ans+toDec(buff);
  if(sta === State.Opt) tmpAns = ans.slice(0,-1);
  tmpAns = eval(tmpAns) + "";
  if(tmpAns.length === 0) tmpAns = "0";
  return tmpAns;
}

function display() {
  // Function
  if(str.length === 0) $("#func").text(buff);
  else if(sta === State.Opt) $("#func").text(str);
  else $("#func").text(str+buff);

  var tmpAns: string = operate();
  var neg: boolean = Number(tmpAns) < 0;
  if(tmpAns.length === 0) tmpAns = "0";
  $(".buff").text(buff);
  var numHex: string = cType(tmpAns, Mode.Dec, Mode.Hex);
  var numDec: string = cType(tmpAns, Mode.Dec, Mode.Dec);
  var numOct: string = cType(tmpAns, Mode.Dec, Mode.Oct);
  var numBin: string = cType(tmpAns, Mode.Dec, Mode.Bin);
  if(neg) {
    $("#hex").text(cType(eval("0xFFFF"+numDec+"+1")+"",Mode.Dec,Mode.Hex));
    $("#dec").text(numDec);
    $("#oct").text(cType(eval("0xFFFF"+numDec+"+1")+"",Mode.Dec,Mode.Oct));
    $("#bin").text(cType(eval("0xFFFF"+numDec+"+1")+"",Mode.Dec,Mode.Bin));
  } else {
    $("#hex").text(numHex);
    $("#dec").text(numDec);
    $("#oct").text(numOct);
    $("#bin").text(numBin);
  }
}

function cType(num: string, mof: Mode, mot: Mode): string {
  if(num.slice(0,1) === "-") {
    if(mot === Mode.Bin) return "-"+Number(head(mof)+num.substr(1,num.length)).toString(2);
    if(mot === Mode.Oct) return "-"+Number(head(mof)+num.substr(1,num.length)).toString(8);
    if(mot === Mode.Dec) return "-"+Number(head(mof)+num.substr(1,num.length)).toString(10);
    if(mot === Mode.Hex) return "-"+Number(head(mof)+num.substr(1,num.length)).toString(16).toUpperCase();
  } else {
    if(mot === Mode.Bin) return Number(head(mof)+num).toString(2);
    if(mot === Mode.Oct) return Number(head(mof)+num).toString(8);
    if(mot === Mode.Dec) return Number(head(mof)+num).toString(10);
    if(mot === Mode.Hex) return Number(head(mof)+num).toString(16).toUpperCase();
  }
}


function Err() {
  window.alert("You can't divide 0!!!");
  $("#func").text("Error");
  $("#hex").text("Error");
  $("#dec").text("Error");
  $("#oct").text("Error");
  $("#bin").text("Error");
  clear();
}

function backspace() {
  if(buff.length > 1 && buff !== "0") {
    buff = buff.slice(0,-1);
    sta = State.Num;
  } else if(buff.length === 1 && buff !== "0") {
    buff = "0";
    sta = State.Opt;
    if(ans === "") sta = State.Init;
  } else {
    buff = "";
    str = str.slice(0,-1);
    ans = ans.slice(0,-1);
    while(checkNum.test(ans.slice(-1))) {
      buff = ans.slice(-1) + buff;
      str = str.slice(0,-1);
      ans = ans.slice(0,-1);
    }
    buff = cType(buff,Mode.Dec,mode);
    sta = State.Num;
  }
  if(buff.length === 0) buff = "0";
  display();
}

function switchMode() {
  if(mode === Mode.Hex) changeMode(Mode.Dec);
  else if(mode === Mode.Dec) changeMode(Mode.Oct);
  else if(mode === Mode.Oct) changeMode(Mode.Bin);
  else if(mode === Mode.Bin) changeMode(Mode.Hex);
}

function changeModeHex() { changeMode(Mode.Hex); }

function changeModeDec() { changeMode(Mode.Dec); }

function changeModeOct() { changeMode(Mode.Oct); }

function changeModeBin() { changeMode(Mode.Bin); }

function changeMode(mo: Mode) {
  equal();
  if(mo === Mode.Hex) {
    buff = cType(buff, mode, mo);
    mode = Mode.Hex;
    $("#inputMode").text("Hex");
    $(".button.hex").removeClass('disabled');
    $(".button.hex").prop('disabled',false);
    $(".button.dec").removeClass('disabled');
    $(".button.dec").prop('disabled',false);
    $(".button.oct").removeClass('disabled');
    $(".button.oct").prop('disabled',false);
    $("#hexButton").addClass('now');
    $("#decButton").removeClass('now');
    $("#octButton").removeClass('now');
    $("#binButton").removeClass('now');
  } else if(mo === Mode.Dec) {
    buff = cType(buff, mode, mo);
    mode = Mode.Dec;
    $("#inputMode").text("Dec");
    $(".button.hex").addClass('disabled');
    $(".button.hex").prop('disabled',true);
    $(".button.dec").removeClass('disabled');
    $(".button.dec").prop('disabled',false);
    $(".button.oct").removeClass('disabled');
    $(".button.oct").prop('disabled',false);
    $("#hexButton").removeClass('now');
    $("#decButton").addClass('now');
    $("#octButton").removeClass('now');
    $("#binButton").removeClass('now');
  } else if(mo === Mode.Oct) {
    buff = cType(buff, mode, mo);
    mode = Mode.Oct;
    $("#inputMode").text("Oct");
    $(".button.hex").addClass('disabled');
    $(".button.hex").prop('disabled',true);
    $(".button.dec").addClass('disabled');
    $(".button.dec").prop('disabled',true);
    $(".button.oct").removeClass('disabled');
    $(".button.oct").prop('disabled',false);
    $("#hexButton").removeClass('now');
    $("#decButton").removeClass('now');
    $("#octButton").addClass('now');
    $("#binButton").removeClass('now');
  } else if(mo === Mode.Bin) {
    buff = cType(buff, mode, mo);
    mode = Mode.Bin;
    $("#inputMode").text("Bin");
    $(".button.hex").addClass('disabled');
    $(".button.hex").prop('disabled',true);
    $(".button.dec").addClass('disabled');
    $(".button.dec").prop('disabled',true);
    $(".button.oct").addClass('disabled');
    $(".button.oct").prop('disabled',true);
    $("#hexButton").removeClass('now');
    $("#decButton").removeClass('now');
    $("#octButton").removeClass('now');
    $("#binButton").addClass('now');
  }
  display();
}

function main(){
  $(".button.num").click(numToQue);
  $(".button.opt").click(optToQue);
  //$(".button.dot").click(dotToQue);
  $(".button.c").click(clear);
  $(".button.ce").click(clearNum);
  $(".button.equ").click(equal);
  $(".button.mode").click(switchMode);
  $(".button.pm").click(plusMin);
  $(".button.bs").click(backspace);
  $("#hexButton").click(changeModeHex);
  $("#decButton").click(changeModeDec);
  $("#octButton").click(changeModeOct);
  $("#binButton").click(changeModeBin);
  //$(".lBracket").click(lBraToQue);
  //$(".rBracket").click(rBracket);
}

$(document).ready(main);