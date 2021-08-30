--OOTP 22 rest of 2021 MLB season simulation

SELECT * FROM "Player Info CSV" pic
LIMIT 10;

--Top Nationalities
SELECT NAT, COUNT(NAT) as TOTAL
FROM "Player Info CSV" pic 
GROUP BY NAT
ORDER BY TOTAL DESC;

--Colleges with most players
SELECT Schl, COUNT(Schl) as TOTAL
FROM "Player Info CSV" pic 
GROUP BY Schl
ORDER BY TOTAL DESC;

--How top colleges perform in MLB
SELECT Schl, AVG(WAR), COUNT(Schl) as TOTAL
FROM "Batting Stats CSV" bsc 
LEFT JOIN "Player Info CSV" pic 
ON pic.ID = bsc.ID 
GROUP BY Schl
ORDER BY TOTAL DESC;

SELECT Schl, AVG(rWAR), AVG(WAR), COUNT(Schl) as TOTAL
FROM "Pitching Stats CSV" psc 
LEFT JOIN "Player Info CSV" pic 
ON pic.ID = psc.ID 
GROUP BY Schl
ORDER BY TOTAL DESC;

--Colleges that produce best hitting results
SELECT Schl, AVG(WAR)
FROM "Batting Stats CSV" bsc 
LEFT JOIN "Player Info CSV" pic 
ON pic.ID = bsc.ID
GROUP BY pic.Schl 
ORDER BY AVG(WAR) DESC






SELECT * 
FROM "Pitching Stats CSV" psc
LIMIT 10;

SELECT rWAR, WAR 
FROM "Pitching Stats CSV" psc
ORDER BY WAR DESC
LIMIT 10;

--Top 10 starters
SELECT psc.Name, pic.TM, pic.T, BF, ERA, FIP, "K%", "BB%", "HR/9", WAR, rWAR
FROM "Pitching Stats CSV" psc 
LEFT JOIN "Player Info CSV" pic 
ON psc.ID = pic.ID 
WHERE psc.POS = 'SP'
ORDER BY rWAR + WAR DESC
LIMIT 10;

--Top 10 relivers
SELECT psc.Name, pic.TM, pic.T, BF, ERA, FIP, "K%", "BB%", SV + HLD as SVHD, WAR, rWAR
FROM "Pitching Stats CSV" psc 
LEFT JOIN "Player Info CSV" pic 
ON psc.ID = pic.ID 
WHERE psc.POS = 'RP'
AND GS = 0
ORDER BY rWAR + WAR DESC
LIMIT 10;



--Top 20 batters
SELECT bsc.POS, bsc.Name, bsc.B, AVG, OBP, SLG, wOBA, "wRC+", WAR 
FROM "Batting Stats CSV" bsc 
LEFT JOIN "Player Info CSV" pic 
ON bsc.ID = pic.ID
ORDER BY WAR DESC
LIMIT 20;