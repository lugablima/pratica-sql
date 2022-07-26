-- Questão 1

SELECT users.id, users.name, cities.name AS city FROM users 
JOIN cities 
ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro'
ORDER BY users.id ASC;


-- Questão 2

SELECT t.id, w.name AS writer, r.name AS recipient, t.message FROM testimonials t
JOIN users w
ON t."writerId" = w.id 
JOIN users r 
ON t."recipientId" = r.id
ORDER BY t.id ASC;


-- Questão 3

SELECT u.id, u.name, c.name AS course, s.name AS school, e."endDate" FROM educations e
JOIN users u
ON e."userId" = u.id
JOIN courses c
ON e."courseId" = c.id
JOIN schools s
ON e."schoolId" = s.id
WHERE e."userId" = 30 AND e.status = 'finished'; 


-- Questão 4

SELECT u.id, u.name, r.name AS role, c.name AS company, e."startDate" FROM experiences e
JOIN users u 
ON e."userId" = u.id
JOIN roles r
ON e."roleId" = r.id
JOIN companies c
ON e."companyId" = c.id
WHERE e."userId" = 50 AND e."endDate" IS NULL;


-- Bônus

SELECT s.id, s.name AS school, c.name AS course, comp.name AS company, r.name AS role 
FROM jobs j
JOIN applicants a 
ON j.id = a."jobId"
JOIN educations e 
ON a."userId" = e."userId"
JOIN schools s
ON e."schoolId" = s.id
JOIN courses c
ON e."courseId" = c.id
JOIN companies comp
ON j."companyId" = comp.id
JOIN roles r
ON j."roleId" = r.id
WHERE j."companyId" = 10 AND r.name = 'Software Engineer' AND j.active = true
ORDER BY s.id ASC;


