
CREATE TABLE [dbo].[Table_1](
	[A] [nvarchar](50) NULL,
	[B] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'a', 1)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'a', 2)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 1)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 1)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 2)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 2)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 3)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 3)
GO
INSERT [dbo].[Table_1] ([A], [B]) VALUES (N'b', 4)
GO


with aa as(

    select A,b  from Table_1

    group by A,B

    having count(*)>1
)
select * from Table_1

where A in

(

    select a from aa

)
and b in
(

   select b from aa
)

order by A



select * from

(

    select row_number() over(partition by A,B order by A) ID,* from Table_1

) Temp

where Temp.ID>1