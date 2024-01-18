-- View all tasks
SELECT * FROM "tasks";

-- Find tasks that are pending
SELECT * FROM "tasks"
WHERE "status" = 'Pending';

-- Find tasks that are overdue
SELECT * FROM "tasks"
WHERE "status" = 'Overdue';

-- Find tasks that have the highest priority
SELECT * FROM "tasks"
WHERE "priority_id" = 1;

-- Find the names of the tasks that the due date is between 15th Jan 2024 and 20th Jan 2024
SELECT "name" FROM "tasks"
WHERE "due_date" BETWEEN '2024-01-15' AND '2024-01-20';

-- Find name, status, due date of tasks sorted by due dates from the nearest date
SELECT "name", "status", "due_date" FROM "tasks"
ORDER BY "due_date" DESC;

-- Find name, description, status of tasks associated with a particular user
SELECT "name", "description", "status" FROM "tasks"
WHERE "user_id" = 1;

-- Add categories and their ID
INSERT INTO "categories" ("id", "name")
VALUES (1, "Work");

INSERT INTO "categories" ("id", "name")
VALUES (2, "Personal");

INSERT INTO "categories" ("id", "name")
VALUES (3, "School");

-- Add priorities and their ID
INSERT INTO "priorities" ("id", "name")
VALUES (1, "High");

INSERT INTO "priorities" ("id", "name")
VALUES (2, "Medium");

INSERT INTO "priorities" ("id", "name")
VALUES (3, "Low");

-- Add users and their ID
INSERT INTO "users" ("id", "username", "password")
VALUES (1, "sasha", "123abc");

INSERT INTO "users" ("id", "username", "password")
VALUES (2, "joely", "456def");

-- Add a new task
INSERT INTO "tasks" ("name", "description", "status", "due_date", "category_id", "priority_id", "user_id")
VALUES ('Write essay', 'Finish English essay by Friday', 'Pending', '2024-01-19', 3, 2, 1);

INSERT INTO "tasks" ("name", "description", "status", "due_date", "category_id", "priority_id", "user_id")
VALUES ('Submit report', 'Email boss after submitting', 'Overdue', '2024-01-01', 1, 1, 2);

-- Update task status as completed for task ID 1
UPDATE "tasks"
SET "status" = 'Completed'
WHERE "id" = 1;

-- Remove a task from the database
DELETE FROM "tasks"
WHERE "id" = 1;
