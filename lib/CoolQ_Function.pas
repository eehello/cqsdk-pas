{
* CoolQ 函数
}

{CoolQ API Char* 调用}
function CQ_sendPrivateMsg(AuthCode:longint;QQID:int64;const msg:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_sendPrivateMsg';
function CQ_sendGroupMsg(AuthCode:longint;groupid:int64;const msg:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_sendGroupMsg';
function CQ_sendDiscussMsg(AuthCode:longint;discussid:int64;const msg:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_sendDiscussMsg';
function CQ_sendLike(AuthCode:longint;QQID:int64):longint;
	stdcall; external 'CQP.dll' name 'CQ_sendLike';
function CQ_setGroupKick(AuthCode:longint;groupid,QQID:int64;rejectaddrequest:boolean):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupKick';
function CQ_setGroupBan(AuthCode:longint;groupid,QQID,duration:int64):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupBan';
function CQ_setGroupWholeBan(AuthCode:longint;groupid:int64;enableban:boolean):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupWholeBan';
function CQ_setGroupAnonymousBan(AuthCode:longint;groupid:int64;const anomymous:Pchar;duration:int64):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupAnonymousBan';
function CQ_setGroupAnonymous(AuthCode:longint;groupid:int64;enableanomymous:boolean):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupAnonymous';
function CQ_setGroupCard(AuthCode:longint;groupid,QQID:int64;newcard:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupCard';
function CQ_setGroupLeave(AuthCode:longint;groupid:int64;isdismiss:boolean):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupLeave';
function CQ_setGroupSpecialTitle(AuthCode:longint;groupid,QQID:int64;newspecialtitle:Pchar;duration:int64):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupSpecialTitle';
function CQ_setDiscussLeave(AuthCode:longint;discussid:int64):longint;
	stdcall; external 'CQP.dll' name 'CQ_setDiscussLeave';
function CQ_setFriendAddRequest(AuthCode:longint;const responseflag:pchar;responseoperation:longint;const remark:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_setFriendAddRequest';
function CQ_setGroupAddRequestV2(AuthCode:longint;const responseflag:Pchar;requesttype,responseoperation:longint;const reason:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_setGroupAddRequestV2';
	
function CQ_getGroupMemberInfoV2(AuthCode:longint;groupid,QQID:int64;nocache:boolean):Pchar;
	stdcall; external 'CQP.dll' name 'CQ_getGroupMemberInfoV2';	
	//待完善

function CQ_getStrangerInfo(AuthCode:longint;QQID:int64;nocache:boolean):Pchar;
	stdcall; external 'CQP.dll' name 'CQ_getStrangerInfo';	
function CQ_addLog(AuthCode,priority:longint;const category,content:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_addLog';
function CQ_getCookies(AuthCode:longint):Pchar;
	stdcall; external 'CQP.dll' name 'CQ_getCookies';
function CQ_getCsrfToken(AuthCode:longint):longint;
	stdcall; external 'CQP.dll' name 'CQ_getCsrfToken';
function CQ_getLoginQQ(AuthCode:longint):int64;
	stdcall; external 'CQP.dll' name 'CQ_getLoginQQ';
function CQ_getLoginNick(AuthCode:longint):Pchar;
	stdcall; external 'CQP.dll' name 'CQ_getLoginNick';
function CQ_getAppDirectory(AuthCode:longint):Pchar;
	stdcall; external 'CQP.dll' name 'CQ_getAppDirectory';
function CQ_setFatal(AuthCode:longint;const errorinfo:Pchar):longint;
	stdcall; external 'CQP.dll' name 'CQ_setFatal';
	
{调用简化}
	//等待更新