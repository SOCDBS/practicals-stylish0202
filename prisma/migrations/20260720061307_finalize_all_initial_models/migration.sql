/*
  Warnings:

  - You are about to drop the `preRequisite` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `staffDependent` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "preRequisite" DROP CONSTRAINT "mod_code_fk";

-- DropForeignKey
ALTER TABLE "preRequisite" DROP CONSTRAINT "requisite_fk";

-- DropForeignKey
ALTER TABLE "staffDependent" DROP CONSTRAINT "staff_dependent_staff_no_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "adm_no_student_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "module_mod_code_fk";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_crse_code_fk";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_nationality_fk";

-- AlterTable
ALTER TABLE "student" ALTER COLUMN "mobile_phone" DROP NOT NULL,
ALTER COLUMN "home_phone" DROP NOT NULL;

-- AlterTable
ALTER TABLE "user_account" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "user_account_id_seq";

-- AlterTable
ALTER TABLE "user_role" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "user_role_id_seq";

-- DropTable
DROP TABLE "preRequisite";

-- DropTable
DROP TABLE "staffDependent";

-- CreateTable
CREATE TABLE "pre_requisite" (
    "mod_code" VARCHAR(10) NOT NULL,
    "requisite" VARCHAR(10) NOT NULL,

    CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("mod_code","requisite")
);

-- CreateTable
CREATE TABLE "staff_dependent" (
    "staff_no" CHAR(4) NOT NULL,
    "dependent_name" VARCHAR(30) NOT NULL,
    "relationship" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no","dependent_name")
);

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "dept_code_fk" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_requisite_fk" FOREIGN KEY ("requisite") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff_dependent" ADD CONSTRAINT "staff_dependent_staff_no_fk" FOREIGN KEY ("staff_no") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
