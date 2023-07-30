--Add column Financial balance into table Teacher

ALTER TABLE Teacher
        ADD FinancialBalance int 
 CONSTRAINT D_SomeTable_FinancialBalance 
    DEFAULT (0)
WITH VALUES 
