{
	Char* 转换到 字符串
}
Function PtoS(a:PAnsiChar):ansistring;
Begin
	result:=strPas(a)
End;

{
	字符串 转换到 Char*
}
Function StoP(a:ansistring):PAnsiChar;
Begin
	result:=PAnsiChar(@a[1]);
End;

{***********************************************************}

{
	数字 转换到 字符串
}
Function NumToChar(a:int64):string;
Begin
	str(a,result);
End;
Function NumToChar_as(a:int64):ansistring;
Begin
	str(a,result);
End;
Function NumToChar_ws(a:int64):widestring;
Begin
	str(a,result);
End;

{
	字符串 转换到 数字
}
Function CharToNum(a:string):int64;
Begin
	//val(a,result);
	result:=StrToInt64Def(a,0);
End;


{
	双精浮点 转换到 字符串
}
Function RealToChar(a:real):string;
Begin
	str(a,result)
End;

{
	字符串 转换到 双精浮点
}
Function CharToReal(a:string):real;
Begin
	//val(a,result);
	result:=StrToFloatDef(a,0);
End;

{
	双精浮点 转换到 能看的字符串
}
Function RealToDisplay(a:real;b:longint):string;
Var
	display:string;
	i:longint;
Begin
	if a>=0 
		then display:=''
		else
		begin
			display:='-';
			a:=-a;
		end;
	
	display:=display+NumToChar(trunc(a));
	a:=(a-trunc(a))*10;
	
	if b<0 then b:=16;
	b:=min(b,16);
	if b<>0 then display:=display+'.';
	
	for i:=1 to b do begin
		display:=display+NumToChar(trunc(a));
		a:=(a-trunc(a))*10;
	end;
	
	result:=display;
	exit;
End;
Function RealToDisplay_as(a:real;b:longint):ansistring;
Var
	display:ansistring;
	i:longint;
Begin
	if a>=0 
		then display:=''
		else
		begin
			display:='-';
			a:=-a;
		end;
	
	display:=display+NumToChar(trunc(a));
	a:=(a-trunc(a))*10;
	
	if b<0 then b:=16;
	b:=min(b,16);
	if b<>0 then display:=display+'.';
	
	for i:=1 to b do begin
		display:=display+NumToChar(trunc(a));
		a:=(a-trunc(a))*10;
	end;
	
	result:=display;
	exit;
End;
Function RealToDisplay_ws(a:real;b:longint):widestring;
Var
	display:widestring;
	i:longint;
Begin
	if a>=0 
		then display:=''
		else
		begin
			display:='-';
			a:=-a;
		end;
	
	display:=display+NumToChar_ws(trunc(a));
	a:=(a-trunc(a))*10;
	
	if b<0 then b:=16;
	b:=min(b,16);
	if b<>0 then display:=display+'.';
	
	for i:=1 to b do begin
		display:=display+NumToChar_ws(trunc(a));
		a:=(a-trunc(a))*10;
	end;
	
	result:=display;
	exit;
End;

{***********************************************************}

Function String_Choose(expression:boolean;a,b:ansistring):ansistring;overload;
Begin
	if expression then result:=a else result:=b;
End;
Function String_Choose(expression:boolean;a,b:widestring):widestring;overload;
Begin
	if expression then result:=a else result:=b;
End;
Function String_Choose_as(expression:boolean;a,b:ansistring):ansistring;
Begin
	if expression then result:=a else result:=b;
End;
Function String_Choose_ws(expression:boolean;a,b:widestring):widestring;
Begin
	if expression then result:=a else result:=b;
End;

Procedure Message_Replace(var a:ansistring;b,c:ansistring);overload;
Var
	i:longint;
	lena,lenb:longint;
Begin
	i:=0;
	lena:=length(a);
	lenb:=length(b);
	repeat
		inc(i);
		if copy(a,i,lenb) = b then begin
			a:=copy(a,1,i-1)+c+copy(a,i+lenb,length(a));
			i:=i+length(c)-1;
		end;
	until i>=lena;
End;
Procedure Message_Replace(var a:widestring;b,c:widestring);overload;
Var
	i:longint;
	lena,lenb:longint;
Begin
	i:=0;
	lena:=length(a);
	lenb:=length(b);
	repeat
		inc(i);
		if copy(a,i,lenb) = b then begin
			a:=copy(a,1,i-1)+c+copy(a,i+lenb,length(a));
			i:=i+length(c)-1;
		end;
	until i>=lena;
End;

Function PowerInt(bas: Int64;expo: Int64) : Int64;
Var
	i:longint;
Begin
	if expo<0 then begin
		result:=0;
		exit;
	end;
	result:=1;
	for i:=1 to expo do
		result:=result*bas;
End;

{***********************************************************}
Function SDECtoHEX(a:integer):char;
Begin
	case a of
		0 : result:=('0');
		1 : result:=('1');
		2 : result:=('2');
		3 : result:=('3');
		4 : result:=('4');
		5 : result:=('5');
		6 : result:=('6');
		7 : result:=('7');
		8 : result:=('8');
		9 : result:=('9');
		10 : result:=('A');
		11 : result:=('B');
		12 : result:=('C');
		13 : result:=('D');
		14 : result:=('E');
		15 : result:=('F');
		else result:='-';
	end;
End;

Function SHEXtoDec(a:char):integer;
Begin
	case upcase(a) of
		'0' : result:=(0);
		'1' : result:=(1);
		'2' : result:=(2);
		'3' : result:=(3);
		'4' : result:=(4);
		'5' : result:=(5);
		'6' : result:=(6);
		'7' : result:=(7);
		'8' : result:=(8);
		'9' : result:=(9);
		'A' : result:=(10);
		'B' : result:=(11);
		'C' : result:=(12);
		'D' : result:=(13);
		'E' : result:=(14);
		'F' : result:=(15);
		else result:=(-1);
	end;
End;

{
	十进制转二进制
}
Function Hex_Conversion_10to2(s:longint):string;
Begin
        result:='';
        while s>0 do begin
			result:=numtochar(s mod 2)+result;
			s:=s div 2;
        end;
        while length(result)<8 do result:='0'+result;
End;
{
	二进制转十进制
}
Function Hex_Conversion_2to10(s:string):longint;
Var
        i:longint;
Begin
        result:=0;
        for i:=length(s) downto 1 do begin
                if s[i]='1' then
                result:=result+PowerInt( 2 , (length(s)-i) );
        end;
End;

Function UrlEncode(s:ansistring):ansistring;
//编码
Var
	a:ansistring;
	i:longint;
Begin
	a:='';

	for i:=1 to length(s) do
		if (integer(s[i])>32) and (integer(s[i])<128)
			and (s[i]<>'"') and (s[i]<>'''')
			and (s[i]<>'/') and (s[i]<>'\')
			and (s[i]<>':') and (s[i]<>'%')
			and (s[i]<>'[') and (s[i]<>']')
			and (s[i]<>',') and (s[i]<>'+') then a:=a+s[i]
		else a:=a+'%'+SDECtoHEX(integer(s[i])div 16)+SDECtoHEX(integer(s[i])mod 16);

	result:=(a);
End;

Function GB2312ASCtoChar(a,b:char):char;
Begin
	result:=(char(SHEXtoDec(a)*16+SHEXtoDec(b)));
End;

Function UrlDecode(s:ansistring):ansistring;
//解码
Var
	i:longint;
	outs:ansistring;
Begin
	outs:='';
	i:=1;
	while i<=length(s) do begin
		if s[i]='%' then begin
			//也许需要转义
			if (SHEXtoDec(s[i+1])<>-1) and (SHEXtoDec(s[i+2])<>-1) then begin
				//需要转义
				outs:=outs+GB2312ASCtoChar(s[i+1],s[i+2]);
				i:=i+3;
			end
			else
			begin
				//依然不需要转义
				outs:=outs+s[i];
				i:=i+1;
			end;
		end
		else
		if s[i]='+' then begin
			outs:=outs+' ';
			i:=i+1;
		end
		else
		begin
			//不需要转义
			outs:=outs+s[i];
			i:=i+1;
		end;
	end;
        result:=(outs);
End;