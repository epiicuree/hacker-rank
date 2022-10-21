/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

Name        Occupation
Meera       Singer
Ashely      Professor
Ketty       Professor
Christeen   Professor
Jane        Actor
Jenny       Doctor
Priya       Singer


Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria


Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.

  


*/



SELECT
    [DOCTOR],
    [PROFESSOR],
    [SINGER],
    [ACTOR]
FROM
    (SELECT 
         ROW_NUMBER() OVER (PARTITION BY Occupation
                            ORDER BY Name) RN,
         [NAME],
         [OCCUPATION] 
     FROM 
         OCCUPATIONS) AS SOURCE 
PIVOT
    (MAX(NAME)
     FOR [OCCUPATION] IN ([DOCTOR],[PROFESSOR],[SINGER],[ACTOR])) AS PVT
ORDER BY RN;