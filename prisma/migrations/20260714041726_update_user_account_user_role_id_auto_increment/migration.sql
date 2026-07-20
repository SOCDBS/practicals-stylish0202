-- AlterTable
CREATE SEQUENCE user_account_id_seq;
ALTER TABLE "user_account" ALTER COLUMN "id" SET DEFAULT nextval('user_account_id_seq');
ALTER SEQUENCE user_account_id_seq OWNED BY "user_account"."id";

-- AlterTable
CREATE SEQUENCE user_role_id_seq;
ALTER TABLE "user_role" ALTER COLUMN "id" SET DEFAULT nextval('user_role_id_seq');
ALTER SEQUENCE user_role_id_seq OWNED BY "user_role"."id";
