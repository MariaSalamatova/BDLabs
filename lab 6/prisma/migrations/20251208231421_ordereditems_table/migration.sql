-- CreateTable
CREATE TABLE "ordered_item" (
    "ordered_id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price_in_order" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "ordered_item_pkey" PRIMARY KEY ("ordered_id")
);

-- AddForeignKey
ALTER TABLE "ordered_item" ADD CONSTRAINT "ordered_item_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ordered_item" ADD CONSTRAINT "ordered_item_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("product_id") ON DELETE CASCADE ON UPDATE NO ACTION;
