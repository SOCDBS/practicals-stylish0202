-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "dept_code_fk" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
