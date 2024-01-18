DROP TABLE "tasks";
DROP TABLE "categories";
DROP TABLE "priorities";
DROP TABLE "users";

-- Represent tasks needed to be done by users
CREATE TABLE "tasks" (
	"id" INTEGER,
	"name" TEXT NOT NULL,
	"description" TEXT,
	"status" TEXT CHECK("status" IN("Pending", "Completed", "Overdue")) NOT NULL,
    "due_date" DATE NOT NULL,
	"category_id" INTEGER NOT NULL,
	"priority_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("category_id") REFERENCES "categories"("id"),
	FOREIGN KEY("priority_id") REFERENCES "priorities"("id")
);

-- Represent category of the task
CREATE TABLE "categories" (
	"id" INTEGER,
	"name" TEXT CHECK("name" IN ("Work", "Personal", "School")) NOT NULL,
	PRIMARY KEY("id")
);

-- Represent priority of the task
CREATE TABLE "priorities" (
	"id" INTEGER,
	"name" TEXT CHECK("name" IN("High", "Medium", "Low")) NOT NULL,
	PRIMARY KEY("id")
);

-- Represent user associated with the task
CREATE TABLE "users" (
	"id" INTEGER,
	"username" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	PRIMARY KEY("id")
);


-- Create indexes to speed common searches
CREATE INDEX "idx_status" ON "tasks"("status");
CREATE INDEX "idx_category_id" ON "tasks"("category_id");
CREATE INDEX "idx_priority_id" ON "tasks"("priority_id");
CREATE INDEX "idx_due_date" ON "tasks"("due_date");
CREATE INDEX "idx_user_id" ON "tasks"("user_id");
