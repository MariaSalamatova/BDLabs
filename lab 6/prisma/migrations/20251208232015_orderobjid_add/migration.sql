/*
  Warnings:

  - The primary key for the `ordered_item` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ordered_id` on the `ordered_item` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "ordered_item" DROP CONSTRAINT "ordered_item_pkey",
DROP COLUMN "ordered_id",
ADD COLUMN     "ordered_object_id" SERIAL NOT NULL,
ADD CONSTRAINT "ordered_item_pkey" PRIMARY KEY ("ordered_object_id");
