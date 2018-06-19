-- ProblemSet01, May,31,2018
-- Submission by l.tyagi@accenture.com

create table Highschooler(ID int, name varchar2(30), grade int);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int);

insert into Highschooler values (1510, 'Jordan', 9);
insert into Highschooler values (1689, 'Gabriel', 9);
insert into Highschooler values (1381, 'Tiffany', 9);
insert into Highschooler values (1709, 'Cassandra', 9);
insert into Highschooler values (1101, 'Haley', 10);
insert into Highschooler values (1782, 'Andrew', 10);
insert into Highschooler values (1468, 'Kris', 10);
insert into Highschooler values (1641, 'Brittany', 10);
insert into Highschooler values (1247, 'Alexis', 11);
insert into Highschooler values (1316, 'Austin', 11);
insert into Highschooler values (1911, 'Gabriel', 11);
insert into Highschooler values (1501, 'Jessica', 11);
insert into Highschooler values (1304, 'Jordan', 12);
insert into Highschooler values (1025, 'John', 12);
insert into Highschooler values (1934, 'Kyle', 12);
insert into Highschooler values (1661, 'Logan', 12);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);

insert into Friend select ID2, ID1 from Friend;

insert into Likes values(1689, 1709);
insert into Likes values(1709, 1689);
insert into Likes values(1782, 1709);
insert into Likes values(1911, 1247);
insert into Likes values(1247, 1468);
insert into Likes values(1641, 1468);
insert into Likes values(1316, 1304);
insert into Likes values(1501, 1934);
insert into Likes values(1934, 1501);
insert into Likes values(1025, 1101); 

/*Find the names of all students who are friends with someone named Gabriel. (1 point possible)*/
select name from highschooler where id in(select ID2 from friend where ID1 in (select id from highschooler where name='Gabriel'));

/*For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like. (1 point possible)*/
select h1.name, h1.grade, h2.name, h2.grade from highschooler h1 join likes on likes.id1 = h1.id join highschooler h2 on h2.id = likes.id2 where(h1.grade-h2.grade)>=2;

/*For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. (1 point possible)*/
select h1.name, h1.grade, h2.name, h2.grade from highschooler h1, highschooler h2, likes l1, likes l2 where h1.ID = l1.ID1 and h2.ID = l1.ID2 and l1.ID1 = l2.ID2 and l1.ID2 = l2.ID1 and l1.ID1 <l1.ID2;

/*Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. (1 point possible)*/
select name,grade from highschooler where ID not in (select distinct ID1 from likes) and id not in (select distinct ID2 from likes)order by 2,1;

/*For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. (1 point possible)*/
select h1.name, h1.grade, h2.name, h2.grade from highschooler h1, highschooler h2, likes l1 where h1.ID = l1.ID1 and h2.ID = l1.ID2 and l1.ID2 not in (select ID1 from likes);

/*Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. (1 point possible)*/
select name, grade from highschooler where id not in ( select id1 from highschooler h1, friend, highschooler h2 where h1.id = Friend.id1 and Friend.id2 = h2.id and h1.grade = h2.grade) order by 2,1;

/*For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C. (1 point possible)*/
select h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade from highschooler h1, Likes, highschooler h2, highschooler h3, Friend F1, Friend F2 where h1.id = Likes.id1 and Likes.id2 = h2.id and h2.id not in (select id2 from Friend where ID1 = h1.id) and h1.id = F1.id1 and F1.id2 = h3.id and h3.id = F2.id1 and F2.id2 = h2.id;

/*Find the difference between the number of students in the school and the number of different first names. (1 point possible)*/
select count(*)-count(distinct name) from highschooler;

/*Find the name and grade of all students who are liked by more than one other student. (1 point possible)*/
select name, grade from highschooler where id in (select id2 from likes group by id2 having count(id1) > 1 );

/*For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C. (1 point possible)*/
select h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade from highschooler h1, highschooler h2, highschooler h3, likes l1, likes l2 where h1.id = l1.id1 AND h2.id = l1.id2 AND (h2.id = l2.id1 AND h3.id = l2.id2 AND h3.id <> h1.id);

/*Find those students for whom all of their friends are in different grades from themselves. Return the students' names and grades.(1 point possible)*/
select name, grade from highschooler h1 where grade not in(select h2.grade from friend, highschooler h2 where h1.id = friend.id1 AND h2.id = friend.id2 );


/*What is the average number of friends per student? (Your result should be just one number.) (1 point possible)*/
select avg(countavg) from(select count(*) as countavg from friend group by id1);

/*Find the number of students who are either friends with Cassandra or are friends of friends of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend.*/
select count(*) from friend where id1 in(select id2 from friend where id1 in(select id from highschooler where name='Cassandra'));

/*Find the name and grade of the student(s) with the greatest number of friends. (1 point possible)*/
