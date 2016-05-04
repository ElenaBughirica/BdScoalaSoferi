select c.Nume,c.Prenume
from cursant c inner join instructor i on c.IDinstructor=i.IDInstructor
where i.Nume='Ionescu'
order by c.nume asc

select m.Numar,m.Marca,sum(im.OreSaptamana) as NrOre
from InstructorMasina im inner join Masina m on im.IDMasina=m.IDMasina
group by im.IDMasina,m.Numar,m.Marca
having sum(im.OreSaptamana)>50

select i.Nume,count(*) as NumarElevi
from Cursant c inner join Instructor i on c.IDinstructor=i.IDInstructor
group by c.IDinstructor,i.nume

select top 1 m.Numar,m.Marca,count(f.IDFisa) as Nr
from Masina m inner join FisaService f on m.IDMasina=f.IDMasina
where year(f.Data)='2010'
group by year(f.Data),m.numar,m.marca
order by count(f.IDFisa) desc

select i.Nume,i.Prenume,i.Salariu 
from Instructor i inner join InstructorMasina im on i.IDInstructor=im.IDInstructor
                  inner join Masina m on m.IDMasina=im.IDMasina
where im.OreSaptamana>10 and m.Marca='Cielo'

select m.Marca,count(*) from InstructorMasina im inner join Instructor i on i.IDInstructor=im.IDInstructor
                                         inner join Cursant c on i.IDInstructor=c.IDinstructor
										 inner join Masina m on m.IDMasina=im.IDMasina
group by im.IDMasina,m.Marca 

select year(cc.DataInscrierii)as Anul,count(*) as NrCursantiAdmisi,(select count(*)  from Cursant c inner join Rezultat r on 
c.IDCursant=r.IDCursant where r.PunctajSala<22 group by year(c.DataInscrierii)) as NrCursantiRespinsi
from Cursant cc inner join Rezultat rr on 
cc.IDCursant=rr.IDCursant where rr.RezultatSala='admis' and rr.RezultatTraseu='admis'
group by year(cc.DataInscrierii)


select i.Nume,i.Prenume,i.Categorie from Instructor i
where i.Categorie='A' or i.Categorie='B' and 40 in (select sum(im.OreSaptamana) from InstructorMasina im
inner join Instructor i on im.IDInstructor=i.IDInstructor group by im.IDInstructor)

select year(DataInscrierii)as An,count(*)as NrCursantilor
from Cursant
group by year(DataInscrierii)
having count(*)=(select max(y.numar) from (select count(*)as numar from Cursant
 group by year(DataInscrierii))as y) 

 select i.Nume,i.Prenume,i.Salariu,i.Categorie from Instructor i
 where i.IDInstructor IN (select c.IDInstructor from Cursant c 
 inner join Rezultat r on c.IDCursant=R.IDCursant where r.RezultatSala='admis' and r.RezultatTraseu='admis')








