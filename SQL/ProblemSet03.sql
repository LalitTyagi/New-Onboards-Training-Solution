-- ProblemSet03, May,30,2018
-- Submission by l.tyagi@accenture.com



Create table Movie(mID number primary key, title varchar2(30), year int, director varchar2(30)); 
Create table Reviewer(rID number primary key, name varchar2(30)); 
Create table Rating (rID number,mID number,stars int,ratingDate date,foreign key(rID) references Reviewer(rID),foreign key(mID) references Movie(mID)); 



insert into movie values(101,'Gone with the Wind',1939,'Victor Fleming');
insert into movie values(102,'Star Wars',1977,'George Lucas');
insert into movie values(103,'The Sound of Music',1965,'George Lucas');
insert into movie values(104,'E.T.',1982,'Robert Wise');
insert into movie values(105,'Titanic',1997,'James Cameron');
insert into movie values(106,'Snow White',1937,'');
insert into movie values(107,'Avatar',2009,'James Cameron');
insert into movie values(108,'Raiders of the Lost Ark',1981,'Steven Spielberg');




insert into reviewer values(201,'Sarah Martinez');
insert into reviewer values(202,'Daniel Lewis');
insert into reviewer values(203,'Brittany Harris');
insert into reviewer values(204,'Mike Anderson');
insert into reviewer values(205,'Chirs Jackson');
insert into reviewer values(206,'Elizabeth Thomas');
insert into reviewer values(207,'James Cameron');
insert into reviewer values(208,'Ashley White');




insert into rating values(201,101,2,to_date('2011-01-22','yyyy-mm-dd'));
insert into rating values(201,101,4,to_date('2011-01-27','yyyy-mm-dd'));
insert into rating values(202,106,4,'');
insert into rating values(203,103,2,to_date('2011-01-20','yyyy-mm-dd'));
insert into rating values(203,108,4,to_date('2011-01-12','yyyy-mm-dd'));
insert into rating values(203,108,2,to_date('2011-01-30','yyyy-mm-dd'));
insert into rating values(204,101,3,to_date('2011-01-09','yyyy-mm-dd'));
insert into rating values(205,103,3,to_date('2011-01-27','yyyy-mm-dd'));
insert into rating values(205,104,2,to_date('2011-01-22','yyyy-mm-dd'));
insert into rating values(205,108,4,'');
insert into rating values(206,107,3,to_date('2011-01-15','yyyy-mm-dd'));
insert into rating values(206,106,5,to_date('2011-01-19','yyyy-mm-dd'));
insert into rating values(207,107,5,to_date('2011-01-20','yyyy-mm-dd'));
insert into rating values(208,104,3,to_date('2011-01-02','yyyy-mm-dd'));




/*Find the titles of all movies directed by Steven Spielberg. (1 point possible)*/
select title from Movie where director='Steven Spielberg'

/*Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)*/
select year from Movie where mID IN (select mID from Rating where stars IN (4,5)) order by year asc

/*Find the titles of all movies that have no ratings. (1 point possible)*/
select title from Movie where mID NOT IN (select mID from Rating)

/*Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. (1 point possible)*/
select name from Reviewer where rID in (select rID from  Rating where ratingDate IS NULL)

/*Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. (1 point possible)*/
select Reviewer.name, Movie.title, Rating.stars, Rating.ratingDate
from Rating join Reviewer on Rating.rId = Reviewer.rID join 
Movie on Movie.mID=Rating.mID order by Reviewer.name,Movie.title,Rating.stars;

/*For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. (1 point possible)
select Reviewer.name, Movie.title from Reviewer, Movie,(select R1.rID as newRid, R1.mID as newMid from Rating R1, Rating R2 where R1.rID=R2.rID and R1.mID=R2.mID and R2.ratingDate>R1.ratingDate and R2.stars>R1.stars) where Reviewer.rID=newRid and Movie.mID=newMid;

/*For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. (1 point possible)*/
select title, MAX(stars) from Rating join Movie on Movie.mID=Rating.mID group by Movie.title order by title

For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. (1 point possible)*/
select Movie.title, Max(Rating.stars) - MIN(Rating.stars) as rating_spread from Movie, Rating where Movie.mID = Rating.mID group by Movie.title order by rating_spread desc, Movie.title

/*Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.) (1 point possible)*/
select max(a1)-min(a1) from (select avg(av1) as a1 from (select avg(stars) as av1 from rating r join movie m on r.mid=m.mid where m.year < 1980 group by r.mid) union
                             select avg(av2) as a1 from (select avg(stars) as av2 from rating r join movie m on r.mid=m.mid where m.year > 1980 group by r.mid))



/*Find the names of all reviewers who rated Gone with the Wind. (1 point possible)*/
select distinct name from Reviewer join Rating using(rID) where rID in (
select rID from Rating join Movie using(mID) where title = 'Gone with the Wind');

/*For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. (1 point possible)*/
select distinct name, title, stars from Rating join Reviewer using(rID) join Movie using(mID) where name = director;

/*Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)*/
select name from (select name from Reviewer union select title as name from Movie)order by name;

/*Find the titles of all movies not reviewed by Chris Jackson. (1 point possible)*/
select title from Movie where mId not in(select mId from Rating inner join Reviewer using(rId) where name = 'Chris Jackson');

/*For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order. (1 point possible)*/
SELECT DISTINCT Re1.name, Re2.name
FROM Rating R1, Rating R2, Reviewer Re1, Reviewer Re2
WHERE R1.mID = R2.mID
AND R1.rID = Re1.rID
AND R2.rID = Re2.rID
AND Re1.name < Re2.name
ORDER BY Re1.name, Re2.name;

select nameFirst, nameSecond
from (select distinct nameFirst, nameSecond
from (select R1.rID as rIDFirst, R2.rID as rIDSecond
from Rating R1 join Rating R2 using(mID)
where R1.mID = R2.mID and R1.rID <> R2.rID)
join
(select rID as rIDFirst, name as nameFirst
from Reviewer) using(rIDFirst)
join
(select rID as rIDSecond, name as nameSecond
from Reviewer) using(rIDSecond)
order by nameFirst)
where nameFirst < nameSecond





/*For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars. (1 point possible)*/
SELECT name, title, stars
FROM Movie
INNER JOIN Rating USING(mId)
INNER JOIN Reviewer USING(rId)
WHERE stars = (SELECT MIN(stars) FROM Rating);


select name, title, stars
from (select rID, mID, stars
from Rating R1
where not exists (select * from Rating R2 where R1.stars > R2.stars) ) join Reviewer using(rID) join Movie using(mID)





/*List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. (1 point possible)*/
select title, AVG(stars) as avst from Rating
join Movie on Movie.mID=Rating.mID
group by Movie.mID
order by avst DESC, title

select title, avgRating
from (select mID, avg(stars) as avgRating
from Rating
group by mID) join Movie using(mID)
order by avgRating desc, title








/*Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) (1 point possible)*/
select title, AVG(stars) as avst from Rating
join Movie on Movie.mID=Rating.mID
group by Movie.mID
order by avst DESC, title

select name
from Rating join Reviewer using(rID)
group by rID
having count(*) >= 3

select distinct name
from (select rID
from Rating R1
where 3 <= (select count(*) from Rating R2 where R1.rID = R2.rID) ) join Reviewer using(rID)





/*Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.) (1 point possible)*/
select title, director 
from movie 
where director in (select director 
                  from (select director, count(title) as s 
                        from movie 
                        group by director) as t
                  where t.s>1)
order by 2,1

select title, director
from Movie
where director in (select director
from Movie
group by director
having count(*) >= 2)
order by director, title

select M1.title, M1.director
from Movie M1, Movie M2
where M1.director = M2.director and M1.mID <> M2.mID
order by M1.director, M1.title






/*Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.) (1 point possible)*/

select m.title, avg(r.stars) as strs from rating r
join movie m on m.mid = r.mid group by r.mid
having strs = (select max(s.stars) as stars from (select mid, avg(stars) as stars from rating
group by mid) as s)


select title, avgRating
from (select mID, avg(stars) as avgRating
from Rating
group by mID) join Movie using(mID)
where not exists (select * from (select avg(stars) as avgTest from Rating group by mID) where avgRating < avgTest)





/*Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) (1 point possible)*/

select m.title, avg(r.stars) as strs from rating r
join movie m on m.mid = r.mid group by r.mid
having strs = (select min(s.stars) as stars from (select mid, avg(stars) as stars from rating
group by mid) as s)

select title, avgRating
from (select mID, avg(stars) as avgRating
from Rating
group by mID) join Movie using(mID)
where not exists (select * from (select avg(stars) as avgTest from Rating group by mID) where avgRating > avgTest)






/*For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. (1 point possible)*/

select director, title, stars
from movie m, rating r
where m.mid = r.mid and director is not null
group by director 
order by stars desc



select distinct director, title, stars
from (select *
from Rating join Movie using(mID) ) BestMovies
where not exists (select * from Rating join Movie using(mID) where BestMovies.director = director and BestMovies.stars < stars) and not director isnull
