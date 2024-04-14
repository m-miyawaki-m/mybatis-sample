-- とりあえず、UpdatedTimesのレコードがまずい


SELECT ut.Type, ut.WriteTime, ut.Message, ut.Direction, m1to8.TableUpdateTime
FROM UpdatedTimes ut
JOIN (
    SELECT Type, Message, Direction, TableUpdateTime,
           ROW_NUMBER() OVER (PARTITION BY Type, Message, Direction ORDER BY TableUpdateTime DESC) AS rn
    FROM Messages1to8
) m1to8 ON ut.Type = m1to8.Type AND ut.Message = m1to8.Message AND ut.Direction = m1to8.Direction
WHERE m1to8.rn = 1
ORDER BY ut.WriteTime DESC;

SELECT ut.Type, ut.WriteTime, ut.Message, ut.Direction, m9to17.TableUpdateTime
FROM UpdatedTimes ut
JOIN (
    SELECT Type, Message, Direction, TableUpdateTime,
           ROW_NUMBER() OVER (PARTITION BY Type, Message, Direction ORDER BY TableUpdateTime DESC) AS rn
    FROM Messages9to17
) m9to17 ON ut.Type = m9to17.Type AND ut.Message = m9to17.Message AND ut.Direction = m9to17.Direction
WHERE m9to17.rn = 1
ORDER BY ut.WriteTime DESC;

SELECT ut.Type, ut.WriteTime, ut.Message, ut.Direction, m18to24.TableUpdateTime
FROM UpdatedTimes ut
JOIN (
    SELECT Type, Message, Direction, TableUpdateTime,
           ROW_NUMBER() OVER (PARTITION BY Type, Message, Direction ORDER BY TableUpdateTime DESC) AS rn
    FROM Messages18to24
) m18to24 ON ut.Type = m18to24.Type AND ut.Message = m18to24.Message AND ut.Direction = m18to24.Direction
WHERE m18to24.rn = 1
ORDER BY ut.WriteTime DESC;

select * from Messages1to8;
select * from Messages9to17;
select * from Messages18to24;








CREATE TABLE UpdatedTimes (
  Type INTEGER,
  WriteTime TIMESTAMP,
  Message VARCHAR2(255),
  Direction VARCHAR2(50)
);

CREATE TABLE Messages1to8 (
  Type INTEGER,
  Message VARCHAR2(255),
  Direction VARCHAR2(50),
  TableUpdateTime TIMESTAMP
);

CREATE TABLE Messages9to17 (
  Type INTEGER,
  Message VARCHAR2(255),
  Direction VARCHAR2(50),
  TableUpdateTime TIMESTAMP
);

CREATE TABLE Messages18to24 (
  Type INTEGER,
  Message VARCHAR2(255),
  Direction VARCHAR2(50),
  TableUpdateTime TIMESTAMP
);


BEGIN
  FOR i IN 1..24 LOOP
    EXECUTE IMMEDIATE 'INSERT INTO UpdatedTimes (Type, WriteTime, Message, Direction) VALUES (:1, CURRENT_TIMESTAMP + INTERVAL ''' || i || ''' SECOND, :2, :3)'
      USING i, 'Message' || i, '送信';
  END LOOP;
  COMMIT;
END;



INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (1,'Message1', '送信', CURRENT_TIMESTAMP + INTERVAL '1' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (2,'Message2', '送信', CURRENT_TIMESTAMP + INTERVAL '2' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (3,'Message3', '送信', CURRENT_TIMESTAMP + INTERVAL '3' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (4,'Message4', '送信', CURRENT_TIMESTAMP + INTERVAL '4' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (5,'Message5', '送信', CURRENT_TIMESTAMP + INTERVAL '5' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (6,'Message6', '送信', CURRENT_TIMESTAMP + INTERVAL '6' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (7,'Message7', '送信', CURRENT_TIMESTAMP + INTERVAL '7' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (8,'Message8', '送信', CURRENT_TIMESTAMP + INTERVAL '8' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (9,'Message1', '送信', CURRENT_TIMESTAMP + INTERVAL '9' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (10,'Message2', '送信', CURRENT_TIMESTAMP + INTERVAL '10' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (11,'Message3', '送信', CURRENT_TIMESTAMP + INTERVAL '11' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (12,'Message4', '送信', CURRENT_TIMESTAMP + INTERVAL '12' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (13,'Message5', '送信', CURRENT_TIMESTAMP + INTERVAL '13' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (14,'Message6', '送信', CURRENT_TIMESTAMP + INTERVAL '14' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (15,'Message7', '送信', CURRENT_TIMESTAMP + INTERVAL '15' SECOND);
INSERT INTO Messages1to8 (Type, Message, Direction, TableUpdateTime) VALUES (16,'Message8', '送信', CURRENT_TIMESTAMP + INTERVAL '16' SECOND);

INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (1,'Message9', '送信', CURRENT_TIMESTAMP + INTERVAL '1' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (2,'Message10', '送信', CURRENT_TIMESTAMP + INTERVAL '2' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (3,'Message11', '送信', CURRENT_TIMESTAMP + INTERVAL '3' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (4,'Message12', '送信', CURRENT_TIMESTAMP + INTERVAL '4' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (5,'Message13', '送信', CURRENT_TIMESTAMP + INTERVAL '5' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (6,'Message14', '送信', CURRENT_TIMESTAMP + INTERVAL '6' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (7,'Message15', '送信', CURRENT_TIMESTAMP + INTERVAL '7' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (8,'Message16', '送信', CURRENT_TIMESTAMP + INTERVAL '8' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (9,'Message17', '送信', CURRENT_TIMESTAMP + INTERVAL '9' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (10,'Message9', '送信', CURRENT_TIMESTAMP + INTERVAL '10' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (11,'Message10', '送信', CURRENT_TIMESTAMP + INTERVAL '11' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (12,'Message11', '送信', CURRENT_TIMESTAMP + INTERVAL '12' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (13,'Message12', '送信', CURRENT_TIMESTAMP + INTERVAL '13' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (14,'Message13', '送信', CURRENT_TIMESTAMP + INTERVAL '14' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (15,'Message14', '送信', CURRENT_TIMESTAMP + INTERVAL '15' SECOND);
INSERT INTO Messages9to17 (Type, Message, Direction, TableUpdateTime) VALUES (16,'Message15', '送信', CURRENT_TIMESTAMP + INTERVAL '16' SECOND);

INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (1,'Message18', '送信', CURRENT_TIMESTAMP + INTERVAL '1' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (2,'Message19', '送信', CURRENT_TIMESTAMP + INTERVAL '2' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (3,'Message20', '送信', CURRENT_TIMESTAMP + INTERVAL '3' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (4,'Message21', '送信', CURRENT_TIMESTAMP + INTERVAL '4' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (5,'Message22', '送信', CURRENT_TIMESTAMP + INTERVAL '5' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (6,'Message23', '送信', CURRENT_TIMESTAMP + INTERVAL '6' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (7,'Message24', '送信', CURRENT_TIMESTAMP + INTERVAL '7' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (8,'Message18', '送信', CURRENT_TIMESTAMP + INTERVAL '8' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (9,'Message19', '送信', CURRENT_TIMESTAMP + INTERVAL '9' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (10,'Message20', '送信', CURRENT_TIMESTAMP + INTERVAL '10' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (11,'Message21', '送信', CURRENT_TIMESTAMP + INTERVAL '11' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (12,'Message22', '送信', CURRENT_TIMESTAMP + INTERVAL '12' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (13,'Message23', '送信', CURRENT_TIMESTAMP + INTERVAL '13' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (14,'Message24', '送信', CURRENT_TIMESTAMP + INTERVAL '14' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (15,'Message18', '送信', CURRENT_TIMESTAMP + INTERVAL '15' SECOND);
INSERT INTO Messages18to24 (Type, Message, Direction, TableUpdateTime) VALUES (16,'Message19', '送信', CURRENT_TIMESTAMP + INTERVAL '16' SECOND);
