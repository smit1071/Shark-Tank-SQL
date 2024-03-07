CREATE DATABASE IF NOT EXISTS sharktank;
use sharktank;

select * from shark;

-- total episodes

select max(EpNo) from shark;
select count(distinct EpNo) from shark;

-- pitches 

select count(distinct brand) from shark;



-- total male

select sum(male) from shark;

-- total female

select sum(female) from shark;

-- gender ratio

select sum(female)/sum(male) from shark;

-- total invested amount

select sum(Amount_invested_lakhs) from shark;


-- highest deal taken;

select max(Amount_invested_lakhs) from shark;

--higheest equity taken;

select max(Equity_Taken) from shark;


-- avg team members

select avg(Team_members) from shark;

-- amount invested per deal

select avg(Amount_invested_lakhs) amount_invested_per_deal from
(select * from shark where deal!='No Deal') a;

-- avg age group of contestants

 select Avg_age,count(Avg_age) cnt from shark
 group by Avg_age
 order by cnt desc;

-- location group of contestants;

select Location,count(Location) cnt from shark
 group by Location
 order by cnt desc;

-- sector group of contestants;

select Sector,count(sector) cnt from shark
 group by sector 
 order by cnt desc;


--partner deals;

select partners,count(partners) cnt from shark
  where partners!='-' 
  group by partners
  order by cnt desc;


