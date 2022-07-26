-- Questão 1 --
SELECT users.id, users.name, cities.name AS "city" FROM users
JOIN cities ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- Questão 2 --
SELECT testimonials.id, writer.name AS "writer", recipient.name AS "recipient", testimonials.message FROM testimonials
JOIN users AS "writer" ON writer.id = testimonials."writerId"
JOIN users AS "recipient" ON recipient.id = testimonials."recipientId"

-- Questão 3 --
SELECT users.id, users.name, courses.name AS "course", schools.name AS "school", educations."endDate" FROM users
JOIN educations ON educations."userId" = users.id
JOIN schools ON educations."schoolId" = schools.id
JOIN courses ON educations."courseId" = courses.id
WHERE users.id = 30
AND educations.status = 'finished';

--Questão 4 --
SELECT users.id, users.name, roles.name AS "role", companies.name AS "company", experiences."startDate" FROM users
JOIN experiences ON experiences."userId" = users.id
JOIN roles ON roles.id = experiences."roleId"
JOIN companies ON companies.id = experiences."companyId"
WHERE users.id = 50
AND experiences."endDate" IS NULL;

-- Questão bônus --
SELECT schools.id, schools.name AS "school", courses.name AS "course", companies.name AS "company", roles.name AS "role" FROM jobs
JOIN companies ON companies.id = jobs."companyId"
JOIN roles ON roles.id = jobs."roleId"
JOIN applicants ON applicants."jobId" = jobs.id
JOIN users ON users.id = applicants."userId"
JOIN educations ON educations."userId" = users.id
JOIN courses ON courses.id = educations."courseId"
JOIN schools ON schools.id = educations."schoolId"
WHERE companies.id = 10
AND jobs.active = true
AND roles.name = 'Software Engineer';