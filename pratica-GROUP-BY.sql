-- Questão 1
SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;

-- Questão 2

SELECT "userId" AS id, COUNT("userId") AS educations 
FROM educations
GROUP BY "userId"
ORDER BY educations DESC;

-- Questão 3

SELECT u.name AS writer, COUNT(t."writerId") AS testimonialCount 
FROM testimonials t
JOIN users u ON t."writerId" = u.id
WHERE t."writerId" = 435
GROUP BY t."writerId", u.name;

-- Questão 4

SELECT MAX(j.salary) AS "maximumSalary", r.name AS role 
FROM jobs j
JOIN roles r ON j."roleId" = r.id
WHERE j.active = true
GROUP BY r.name
ORDER BY "maximumSalary" ASC;

-- Bônus

SELECT s.name AS school, c.name AS course, COUNT(e."userId") AS "studentsCount", e.status AS role  
FROM educations e
JOIN schools s ON e."schoolId" = s.id
JOIN courses c ON e."courseId" = c.id
WHERE e.status = 'ongoing' OR e.status = 'finished'
GROUP BY course, school, role
ORDER BY "studentsCount" DESC
LIMIT 3;