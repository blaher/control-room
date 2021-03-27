-- CreateTable
CREATE TABLE "Workout" (
    "id" SERIAL NOT NULL,
    "workoutTypeId" INTEGER NOT NULL,
    "completed" TIMESTAMP(3),
    "weight" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkoutType" (
    "id" SERIAL NOT NULL,
    "workoutTypeTargetId" INTEGER,
    "name" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkoutTypeTarget" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkoutSet" (
    "id" SERIAL NOT NULL,
    "workoutId" INTEGER NOT NULL,
    "completed" TIMESTAMP(3) NOT NULL,
    "reps" INTEGER,
    "minutes" INTEGER,
    "distance" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WorkoutType.name_unique" ON "WorkoutType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "WorkoutTypeTarget.name_unique" ON "WorkoutTypeTarget"("name");

-- AddForeignKey
ALTER TABLE "Workout" ADD FOREIGN KEY ("workoutTypeId") REFERENCES "WorkoutType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkoutType" ADD FOREIGN KEY ("workoutTypeTargetId") REFERENCES "WorkoutTypeTarget"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkoutSet" ADD FOREIGN KEY ("workoutId") REFERENCES "Workout"("id") ON DELETE CASCADE ON UPDATE CASCADE;
