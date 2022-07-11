-- e1q1
SELECT s.NAME_OF_SCHOOL, s.COMMUNITY_AREA_NAME, s.AVERAGE_STUDENT_ATTENDANCE FROM chicago_public_schools AS s LEFT JOIN `chicago_socioeconomic_data` AS e ON s.COMMUNITY_AREA_NUMBER = e.COMMUNITY_AREA_NUMBER WHERE e.HARDSHIP_INDEX = 98;
-- e1q2
SELECT c.CASE_NUMBER, c.PRIMARY_TYPE, s.COMMUNITY_AREA_NAME FROM chicago_crime as c LEFT JOIN chicago_socioeconomic_data as s on c.COMMUNITY_AREA_NUMBER = s.COMMUNITY_AREA_NUMBER WHERE c.LOCATION_DESCRIPTION like "%school%";
-- e2
CREATE VIEW new_view (School_Name, Safety_Rating, Family_Rating, Environment_Rating, Instruction_Rating, Leaders_Rating, Teachers_Rating)
AS SELECT s.NAME_OF_SCHOOL, s.Safety_Icon, s.Family_Involvement_Icon, s.Environment_Icon, s.Instruction_Icon, s.Leaders_Icon, s.Teachers_Icon
FROM chicago_public_schools as s
-- e3q1
DELIMITER @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
   IN in_School_ID INTEGER, IN in_Leader_Score INTEGER )     
BEGIN 
END @
DELIMITER ;
-- e3q2
DELIMITER @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
   IN in_School_ID INTEGER, IN in_Leader_Score INTEGER )     
BEGIN 
    UPDATE chicago_public_schools
    SET `Leaders_Score` = in_Leader_Score
    WHERE `School_ID` = in_School_ID;
END @
DELIMITER ;
-- e3q3
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER) 
BEGIN 
    UPDATE CHICAGO_PUBLIC_SCHOOLS
    SET "Leaders_Score" = in_Leader_Score
        WHERE "School_ID" = in_School_ID;   
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET "Leaders_Icon" = 'Very Weak';
    ELSEIF in_Leader_Score < 40 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET "Leaders_Icon" = 'Weak';	
    ELSEIF in_Leader_Score < 60 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET "Leaders_Icon" = 'Average';
    ELSEIF in_Leader_Score < 80 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET "Leaders_Icon" = 'Strong';
    ELSEIF in_Leader_Score < 100 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET "Leaders_Icon" = 'Very Strong';
    ELSE
    ROLLBACK;
    END IF;
END@
-- e4q1
DELIMITER @
CREATE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER) 
BEGIN 
    UPDATE CHICAGO_PUBLIC_SCHOOLS
    SET `Leaders_Score` = in_Leader_Score
        WHERE "School_ID" = in_School_ID;   
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Very Weak';
    ELSEIF in_Leader_Score < 40 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Weak';	
    ELSEIF in_Leader_Score < 60 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Average';
    ELSEIF in_Leader_Score < 80 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Strong';
    ELSEIF in_Leader_Score < 100 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Very Strong';
    ELSE
    ROLLBACK;
    END IF;
END@
DELIMITER ;
-- e4q2
DELIMITER @
CREATE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER) 
BEGIN 
    UPDATE CHICAGO_PUBLIC_SCHOOLS
    SET `Leaders_Score` = in_Leader_Score
        WHERE "School_ID" = in_School_ID;   
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Very Weak';
    ELSEIF in_Leader_Score < 40 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Weak';	
    ELSEIF in_Leader_Score < 60 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Average';
    ELSEIF in_Leader_Score < 80 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Strong';
    ELSEIF in_Leader_Score < 100 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
            SET `Teachers_Icon` = 'Very Strong';
    ELSE
    ROLLBACK;
    END IF;
    COMMIT;
END@
DELIMITER ;