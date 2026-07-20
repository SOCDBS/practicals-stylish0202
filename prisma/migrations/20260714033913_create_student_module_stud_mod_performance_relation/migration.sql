-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "module_mod_code_fk" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "adm_no_student_fk" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE RESTRICT ON UPDATE CASCADE;
