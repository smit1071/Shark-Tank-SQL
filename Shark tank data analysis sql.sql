CREATE DATABASE IF NOT EXISTS sharktank;
use sharktank;
create table shark;
select * from shark

-- total episodes

select max(epno) from shark;
select count(distinct epno) from shark;

-- pitches 

select count(distinct brand) from shark;


-- pitches converted

select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) from (
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from shark) a

-- total male

select sum(male) from shark;

-- total female

select sum(female) from shark;

-- gender ratio

select sum(female)/sum(male) from shark;

-- total invested amount

select sum(amountinvestedlakhs) from shark;


-- highest deal taken

select max(amountinvestedlakhs) from shark;

--higheest equity taken

select max(equitytakenp) from shark

-- startups having at least women

select sum(a.female_count) startups having at least women from (
select female,case when female>0 then 1 else 0 end as female_count from shark) a



-- avg team members

select avg(teammembers) from shark;

-- amount invested per deal

select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from shark where deal!='No Deal') a;

-- avg age group of contestants

 select avgage,count(avgage) cnt from shark
 group by avgage 
 order by cnt desc;

-- location group of contestants

select location,count(location) cnt from shark
 group by location 
 order by cnt desc;

-- sector group of contestants

select sector,count(sector) cnt from shark
 group by sector 
 order by cnt desc;


--partner deals

select partners,count(partners) cnt from shark
  where partners!='-' 
  group by partners
  order by cnt desc;


-- which is the startup in which the highest amount has been invested in each domain/sector

select c.* from 
(select brand,sector,amountinvestedlakhs,rank() over(partition by sector order by amountinvestedlakhs desc) rnk 

from shark) c

where c.rnk=1