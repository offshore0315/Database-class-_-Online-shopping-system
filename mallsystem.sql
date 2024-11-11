create table if not exists dingdan
(
    Hno       char(10)                not null,
    Sno       char(10) default '2023' not null,
    Ddate     datetime                not null,
    Dtotal    float                   not null,
    object_id varchar(500)            null,
    Did       int                     null
);

create index 商品编号
    on dingdan (Sno);

create index 订单信息表_ibfk_1
    on dingdan (Hno);

create table if not exists gly
(
    GLno       char(10) not null
        primary key,
    GLname     char(20) not null,
    GLpassword char(20) not null,
    GLtel      char(20) not null
);

create table if not exists huiyuan
(
    Hno       char(10)    not null
        primary key,
    Hname     char(20)    not null,
    Hpassword char(20)    not null,
    Htel      char(20)    not null,
    Hadd      varchar(40) not null,
    constraint Hname
        unique (Hname)
);

create table if not exists object_pictures
(
    Sno          varchar(10) null,
    picture_path varchar(60) null
);

create table if not exists quanxian
(
    Qno    char(10) not null
        primary key,
    Qname  char(20) not null,
    Qintro char(20) not null
);

create table if not exists glyquanxian
(
    GLno char(10) not null
        primary key,
    Qno  char(10) not null,
    constraint glyquanxian_ibfk_1
        foreign key (Qno) references quanxian (Qno)
            on update cascade on delete cascade,
    constraint glyquanxian_ibfk_2
        foreign key (GLno) references gly (GLno)
            on update cascade on delete cascade
);

create index 权限编号
    on glyquanxian (Qno);

create table if not exists shangpinzu
(
    SZno    char(10) not null
        primary key,
    SZname  char(20) not null,
    GLno    char(10) not null,
    SZintro char(20) null,
    constraint shangpinzu_ibfk_1
        foreign key (GLno) references gly (GLno)
            on update cascade on delete cascade
);

create table if not exists shangpin
(
    Sno    char(10) not null
        primary key,
    SZno   char(10) not null,
    Sname  char(20) not null,
    Sprice float    not null,
    Sintro char(20) null,
    constraint shangpin_ibfk_1
        foreign key (SZno) references shangpinzu (SZno)
            on update cascade on delete cascade
);

create table if not exists gouwuche
(
    Gno  int auto_increment
        primary key,
    Hno  char(10) not null,
    Sno  char(10) not null,
    Snum int      not null,
    constraint Sno
        unique (Sno),
    constraint gouwuche_ibfk_1
        foreign key (Hno) references huiyuan (Hno)
            on update cascade on delete cascade,
    constraint gouwuche_ibfk_2
        foreign key (Sno) references shangpin (Sno)
            on update cascade on delete cascade
);

create index 会员编号
    on gouwuche (Hno);

create index 商品组编号
    on shangpin (SZno);

create index 管理员编号
    on shangpinzu (GLno);


-- 订单添加
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13206', '2023', '2023-01-16 00:33:50', 345.78, '01001&01002', null);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13206', '2023', '2023-01-16 01:21:31', 5998, '02002&020021&', 1673803291);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13206', '2023', '2023-01-16 01:23:06', 1550, '03002&05001&', 1673803386);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13206', '2023', '2023-01-16 01:24:15', 3009, '02001&01002&', 1673803455);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13207', '2023', '2023-01-16 20:06:43', 7528, '01002&02001&020021&03002&', 1673870803);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13207', '2023', '2023-01-16 20:45:12', 3779, '020021&03001&', 1673873112);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13207', '2023', '2023-01-16 21:03:55', 5998, '02001&020021&', 1673874235);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13207', '2023', '2023-01-17 08:16:30', 5299, '02001&03002&03001&', 1673914590);
INSERT INTO mall_system.dingdan (Hno, Sno, Ddate, Dtotal, object_id, Did) VALUES ('13207', '2023', '2023-01-17 08:19:18', 5998, '02001&02002&', 1673914758);

-- 管理员表
INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11001', '张三', 'zhangsan', '1212121211');
INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11002', '李四', 'lisi', '1212121212');
INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11003', '王五', 'wangwu', '1212121213');

-- 会员

INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11001', '张三', 'zhangsan', '1212121211');
INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11002', '李四', 'lisi', '1212121212');
INSERT INTO mall_system.gly (GLno, GLname, GLpassword, GLtel) VALUES ('11003', '王五', 'wangwu', '1212121213');

-- 图片列表

INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519271.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519271.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519272.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519273.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519274.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01001', 'http://localhost:8090/pictures/2023011519275.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010011', 'http://localhost:8090/pictures/2023011519276.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010011', 'http://localhost:8090/pictures/2023011519277.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010011', 'http://localhost:8090/pictures/2023011519278.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010011', 'http://localhost:8090/pictures/2023011519279.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010011', 'http://localhost:8090/pictures/20230115192710.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01002', 'http://localhost:8090/pictures/20230115192711.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01002', 'http://localhost:8090/pictures/20230115192712.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01002', 'http://localhost:8090/pictures/20230115192713.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01002', 'http://localhost:8090/pictures/20230115192714.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('01002', 'http://localhost:8090/pictures/20230115192715.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010021', 'http://localhost:8090/pictures/20230115192716.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010021', 'http://localhost:8090/pictures/20230115192717.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010021', 'http://localhost:8090/pictures/20230115192718.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010021', 'http://localhost:8090/pictures/20230115192719.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('010021', 'http://localhost:8090/pictures/20230115192720.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020011', 'http://localhost:8090/pictures/20230115192721.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020011', 'http://localhost:8090/pictures/20230115192722.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020011', 'http://localhost:8090/pictures/20230115192723.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020011', 'http://localhost:8090/pictures/20230115192724.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020011', 'http://localhost:8090/pictures/20230115192725.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02001', 'http://localhost:8090/pictures/20230115192726.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02001', 'http://localhost:8090/pictures/20230115192727.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02001', 'http://localhost:8090/pictures/20230115192728.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02001', 'http://localhost:8090/pictures/20230115192729.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02001', 'http://localhost:8090/pictures/20230115192730.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02002', 'http://localhost:8090/pictures/20230115192731.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02002', 'http://localhost:8090/pictures/20230115192732.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02002', 'http://localhost:8090/pictures/20230115192733.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02002', 'http://localhost:8090/pictures/20230115192734.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('02002', 'http://localhost:8090/pictures/20230115192735.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020021', 'http://localhost:8090/pictures/20230115192736.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020021', 'http://localhost:8090/pictures/20230115192737.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020021', 'http://localhost:8090/pictures/20230115192738.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020021', 'http://localhost:8090/pictures/20230115192739.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020021', 'http://localhost:8090/pictures/20230115192740.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020031', 'http://localhost:8090/pictures/20230115192741.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020031', 'http://localhost:8090/pictures/20230115192742.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020031', 'http://localhost:8090/pictures/20230115192743.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020031', 'http://localhost:8090/pictures/20230115192744.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('020031', 'http://localhost:8090/pictures/20230115192745.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192746.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192747.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192748.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192749.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192750.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192750.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192751.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192752.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192753.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192754.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03001', 'http://localhost:8090/pictures/20230115192755.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192756.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192757.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192758.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192759.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030011', 'http://localhost:8090/pictures/20230115192760.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03002', 'http://localhost:8090/pictures/20230115192761.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03002', 'http://localhost:8090/pictures/20230115192762.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03002', 'http://localhost:8090/pictures/20230115192763.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03002', 'http://localhost:8090/pictures/20230115192764.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('03002', 'http://localhost:8090/pictures/20230115192765.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030021', 'http://localhost:8090/pictures/20230115192766.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030021', 'http://localhost:8090/pictures/20230115192767.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030021', 'http://localhost:8090/pictures/20230115192768.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030021', 'http://localhost:8090/pictures/20230115192769.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('030021', 'http://localhost:8090/pictures/20230115192770.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('04001', 'http://localhost:8090/pictures/20230115192771.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('04001', 'http://localhost:8090/pictures/20230115192772.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('04001', 'http://localhost:8090/pictures/20230115192773.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('04001', 'http://localhost:8090/pictures/20230115192774.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('04001', 'http://localhost:8090/pictures/20230115192775.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('040011', 'http://localhost:8090/pictures/20230115192776.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('040011', 'http://localhost:8090/pictures/20230115192777.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('040011', 'http://localhost:8090/pictures/20230115192778.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('040011', 'http://localhost:8090/pictures/20230115192779.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('040011', 'http://localhost:8090/pictures/20230115192780.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('05001', 'http://localhost:8090/pictures/20230115192781.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('05001', 'http://localhost:8090/pictures/20230115192782.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('05001', 'http://localhost:8090/pictures/20230115192783.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('05001', 'http://localhost:8090/pictures/20230115192784.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('05001', 'http://localhost:8090/pictures/20230115192785.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('06001', 'http://localhost:8090/pictures/20230115192786.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('06001', 'http://localhost:8090/pictures/20230115192787.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('06001', 'http://localhost:8090/pictures/20230115192788.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('06001', 'http://localhost:8090/pictures/20230115192789.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('06001', 'http://localhost:8090/pictures/20230115192790.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('07001', 'http://localhost:8090/pictures/20230115192791.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('07001', 'http://localhost:8090/pictures/20230115192792.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('07001', 'http://localhost:8090/pictures/20230115192793.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('07001', 'http://localhost:8090/pictures/20230115192794.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('07001', 'http://localhost:8090/pictures/20230115192795.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('08001', 'http://localhost:8090/pictures/20230115192796.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('08001', 'http://localhost:8090/pictures/20230115192797.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('08001', 'http://localhost:8090/pictures/20230115192798.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('08001', 'http://localhost:8090/pictures/20230115192799.jpg');
INSERT INTO mall_system.object_pictures (Sno, picture_path) VALUES ('08001', 'http://localhost:8090/pictures/202301151927100.jpg');


-- 权限

INSERT INTO mall_system.quanxian (Qno, Qname, Qintro) VALUES ('989810', '普通店小二李子', '可以添加删除或者修改自己名下的商品信息');

-- 管理员权限

INSERT INTO mall_system.quanxian (Qno, Qname, Qintro) VALUES ('989810', '普通店小二李子', '可以添加删除或者修改自己名下的商品信息');

-- 商品组

INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('001', '女装', '11001', '女性');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('002', '男装', '11002', '男性');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('003', '童装', '11001', '儿童');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('004', '零食', '11002', '美食');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('005', '苹果', '11002', '水果');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('006', '数码装', '11003', '国产');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('007', '灯品', '11003', '装饰');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('008', '汉服', '11001', '古风');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('009', '卡地亚', '11002', '珠宝');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('010', '欧米茄', '11001', '名表');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('011', '兰蔻', '11002', '美妆');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('012', '阿迪达斯', '11002', '球具');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('013', '普拉达', '11003', '眼镜');
INSERT INTO mall_system.shangpinzu (SZno, SZname, GLno, SZintro) VALUES ('014', '帕克', '11003', '名笔');

-- 商品

INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('01001', '004', '老干妈', 10, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('010011', '004', '麻辣烫', 20, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('01002', '004', '方便面', 10, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('010021', '004', '陕西馍', 10, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('02001', '006', '小米', 2999, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('020011', '006', 'OPPO Reno', 2999, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('02002', '006', '华为Pro30', 2999, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('020021', '006', '一加', 2999, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('02003', '002', '老干妈', 10, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('020031', '002', '橄榄菜', 10, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('03001', '001', '波司登', 780, '来自外国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('030011', '010', '欧家', 780, '来自外国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('03002', '001', 'cercle', 1520, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('030021', '010', '罗宾尼', 1100, '来自外国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('04001', '004', '饼干', 10, '未知');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('040011', '004', '比利时饼干', 30, '比利时');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('05001', '005', '牛油果', 30, '来自墨西哥');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('050011', '005', '青芒', 30, '来自越南');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('05002', '005', '车厘子', 80, '来自美国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('050021', '005', '靑椰', 80, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('06001', '006', '窗帘', 998, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('060011', '006', '床帘', 998, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('07001', '002', '海澜之家', 798, '来自中国');
INSERT INTO mall_system.shangpin (Sno, SZno, Sname, Sprice, Sintro) VALUES ('08001', '003', '儿童之家', 589, '来自中国');


-- 购物车


-- 视图
create or replace definer = messi@`%` view dingdanview as
select `mall_system`.`dingdan`.`Did`     AS `Dno`,
       `mall_system`.`dingdan`.`Hno`     AS `Hno`,
       `mall_system`.`dingdan`.`Sno`     AS `Sno`,
       `mall_system`.`dingdan`.`Dtotal`  AS `Dtotal`,
       `mall_system`.`shangpin`.`Sprice` AS `Sprice`,
       `mall_system`.`dingdan`.`Ddate`   AS `Ddate`
from `mall_system`.`dingdan`
         join `mall_system`.`shangpin`
where (`mall_system`.`dingdan`.`Sno` = `mall_system`.`shangpin`.`Sno`);

create or replace definer = messi@`%` view shangpinview as
select `mall_system`.`shangpin`.`Sno`    AS `Sno`,
       `mall_system`.`shangpin`.`SZno`   AS `SZno`,
       `mall_system`.`shangpin`.`Sname`  AS `Sname`,
       `mall_system`.`shangpin`.`Sprice` AS `Sprice`,
       `mall_system`.`shangpin`.`Sintro` AS `Sintro`
from `mall_system`.`shangpin`
         join `mall_system`.`shangpinzu`
where (`mall_system`.`shangpin`.`SZno` = `mall_system`.`shangpinzu`.`SZno`);

