// JavaScript Document
function focusInput() {
	var f = document.forms.form;
	f.input.focus();
}

flag = new Array();
function tree(num){
    mitem = document.getElementById("mitem" + num)
    if(flag[num] == 1){
        mitem.style.display='none';
        flag[num] = 0;
    }
    else{
        mitem.style.display='block';
        flag[num] = 1;
    }
}