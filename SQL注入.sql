
/*



MatricxEntities db = new MatricxEntities();

string str = "mas 'or 1=1 --";
var info = db.MENU.SqlQuery("select * from Menu where MENUNAME='" + str + "'");
var d = info.ToList();


--����sql���

select * from Menu where MENUNAME='mas 'or 1=1 --'



string str = "' or ''='";
var info = db.MENU.SqlQuery("select * from Menu where MENUNAME='" + str + "' and MENUNAME='" + str + "'");
var d = info.ToList();


--����sql���

select * from Menu where MENUNAME='' or ''='' and MENUNAME='' or ''=''

*/


select * from Menu where MENUNAME='mas 'or 1=1 --'

select * from Menu where MENUNAME='' or ''='' and MENUNAME='' or ''=''

Execute(

--ʹ��SQL�������б���