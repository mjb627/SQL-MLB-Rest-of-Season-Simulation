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


SELECT * FROM "Pitching Stats CSV" psc
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



SELECT * FROM "Batting Stats CSV" bsc 
LIMIT 10

--Top 20 batters
SELECT bsc.POS, bsc.Name, bsc.B, AVG, OBP, SLG, wOBA, "wRC+", WAR 
FROM "Batting Stats CSV" bsc 
LEFT JOIN "Player Info CSV" pic 
ON bsc.ID = pic.ID
ORDER BY WAR DESC
LIMIT 20;