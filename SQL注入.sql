
/*



MatricxEntities db = new MatricxEntities();

string str = "mas 'or 1=1 --";
var info = db.MENU.SqlQuery("select * from Menu where MENUNAME='" + str + "'");
var d = info.ToList();


--生成sql语句

select * from Menu where MENUNAME='mas 'or 1=1 --'



string str = "' or ''='";
var info = db.MENU.SqlQuery("select * from Menu where MENUNAME='" + str + "' and MENUNAME='" + str + "'");
var d = info.ToList();


--生成sql语句

select * from Menu where MENUNAME='' or ''='' and MENUNAME='' or ''=''

*/


select * from Menu where MENUNAME='mas 'or 1=1 --'

select * from Menu where MENUNAME='' or ''='' and MENUNAME='' or ''=''

Execute(

--使用SQL参数进行保护