/**********************************************************/
--                                                       --
--  重点 不熟悉的地方  Iinicap 和 InStr  首字母大写 查找函数  --
--                                                       --
/**********************************************************/

-- 1. lower
--全小写
select lower('JaKe Linke') from dual;
-- 2. Upeer 
--全大写
select upper('Jake Linke') from dual;
-- 3. initcap
-- 首字母大写 
select INITCAP('the soap') Catpure from dual;
-- 4. Repalce
--替换
select  replace('ABAAACDEFGABCDEFG','A','_') from dual;
-- 5. Lnegth
--获取长都
select Length('ABDEFGHIJKLMN') FROM DUAL;
-- 6. SubStr(string,start,end) 
-- SubStr(string,start)
-- 截取字符串
select substr('ABCDEFGHIJKLMNOPQRSDUVWSYZ',0,5) FROM DUAL;
select substr('ABCDEFGHIJKLMNOPQRSDUVWSYZ',5) FROM DUAL;
-- CHR ASCII
select CHR(73) FROM DUAL;      -- 73->I
SELECT ascii('I') FROM DUAL;   -- i->73
-- trim 消除空格
select   trim('   ABCDEFG   ') from DUAL;
-- LPAD RPAD
select LPAD('ABCD',50,'_') from dual;
select RPAD('ABCD',50,'_') from dual;
--INSTR
-- 查找 查找字符第一次出现的位置 返回逻辑位置从1开始
select INSTRB('CORPORATE FLOOR','OR') as results FROM DUAL;

select INSTRB('CORPORATE FLOOR','XXX') as results FROM DUAL;












