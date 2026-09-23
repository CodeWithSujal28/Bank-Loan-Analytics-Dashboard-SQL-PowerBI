-- Creating Table & Columns 

CREATE TABLE financial_loan (
    ISSUE_DATE DATE,
    ID BIGINT,
    PURPOSE VARCHAR(100),
    VERIFICATION_STATUS VARCHAR(50),
    GRADE VARCHAR(10),
    HOME_OWNERSHIP VARCHAR(50),
    ADDRESS_STATE VARCHAR(10),
    LOAN_STATUS VARCHAR(50),
    EMP_LENGTH VARCHAR(20),
    EMP_TITLE VARCHAR(200),
    LAST_CREDIT_PULL_DATE DATE,
    LAST_PAYMENT_DATE DATE,
    NEXT_PAYMENT_DATE DATE,
    MEMBER_ID BIGINT,
    SUB_GRADE VARCHAR(10),
    TERM VARCHAR(20),
    ANNUAL_INCOME NUMERIC(12,2),
    DTI NUMERIC(8,4),
    INSTALLMENT NUMERIC(12,2),
    INT_RATE NUMERIC(8,4),
    LOAN_AMOUNT BIGINT,
    TOTAL_ACC BIGINT,
    TOTAL_PAYMENT BIGINT
);

-- PART 1 — EDA using SQL

-- 1. Check the total number of records

SELECT 
COUNT(*) AS total_records
FROM financial_loan;

-- 2. Check the columns

SELECT *
FROM financial_loan
LIMIT 5;

-- 3. Check for duplicate records

-- Duplicate Loan IDs
SELECT 
id, COUNT(*) AS count
FROM financial_loan
GROUP BY id
HAVING COUNT(*) > 1;

-- Duplicate Member IDs
SELECT 
member_id, COUNT(*) AS count
FROM financial_loan
GROUP BY member_id
HAVING COUNT(*) > 1;

-- 4. Check missing values

SELECT
    COUNT(*) - COUNT(issue_date) AS issue_date_missing,
    COUNT(*) - COUNT(id) AS id_missing,
    COUNT(*) - COUNT(purpose) AS purpose_missing,
    COUNT(*) - COUNT(verification_status) AS verification_missing,
    COUNT(*) - COUNT(grade) AS grade_missing,
    COUNT(*) - COUNT(home_ownership) AS home_ownership_missing,
    COUNT(*) - COUNT(address_state) AS state_missing,
    COUNT(*) - COUNT(loan_status) AS loan_status_missing,
    COUNT(*) - COUNT(emp_length) AS emp_length_missing,
    COUNT(*) - COUNT(emp_title) AS emp_title_missing,
    COUNT(*) - COUNT(annual_income) AS income_missing,
    COUNT(*) - COUNT(dti) AS dti_missing,
    COUNT(*) - COUNT(int_rate) AS interest_rate_missing,
    COUNT(*) - COUNT(loan_amount) AS loan_amount_missing,
    COUNT(*) - COUNT(total_payment) AS total_payment_missing
FROM financial_loan;

-- 5. Check the date range

SELECT
    MIN(issue_date) AS first_loan_date,
    MAX(issue_date) AS last_loan_date
FROM financial_loan;

-- 6. Check the loan status distribution

SELECT
    loan_status,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;

-- 7. Check loan purpose

SELECT
    purpose,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY purpose
ORDER BY total_loans DESC;

-- 8. Check loan grades

SELECT
    grade,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY grade
ORDER BY grade;

-- 9. Check sub-grade distribution

SELECT
    sub_grade,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY sub_grade
ORDER BY sub_grade;

-- 10. Check home ownership

SELECT
    home_ownership,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY home_ownership
ORDER BY total_loans DESC;

-- 11. Check verification status

SELECT
    verification_status,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY verification_status
ORDER BY total_loans DESC;

-- 12. Check loan term

SELECT
    term,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY term
ORDER BY total_loans DESC;

-- 13. Check state-wise loans

SELECT
    address_state,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY address_state
ORDER BY total_loans DESC;

-- 14. Basic statistics for loan amount

SELECT
    MIN(loan_amount) AS min_loan,
    MAX(loan_amount) AS max_loan,
    ROUND(AVG(loan_amount), 2) AS avg_loan
FROM financial_loan;

-- 15. Basic statistics for annual income

SELECT
    MIN(annual_income) AS min_income,
    MAX(annual_income) AS max_income,
    ROUND(AVG(annual_income), 2) AS avg_income
FROM financial_loan;

-- 16. Basic statistics for interest rate

SELECT
    MIN(int_rate) AS min_interest_rate,
    MAX(int_rate) AS max_interest_rate,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM financial_loan;

-- 17. Basic statistics for DTI

SELECT
    MIN(dti) AS min_dti,
    MAX(dti) AS max_dti,
    ROUND(AVG(dti) * 100, 2) AS avg_dti
FROM financial_loan;

-- 18. Check loan amount ranges

SELECT
    CASE
        WHEN loan_amount < 5000 THEN 'Below 5K'
        WHEN loan_amount < 10000 THEN '5K - 10K'
        WHEN loan_amount < 20000 THEN '10K - 20K'
        ELSE '20K+'
    END AS loan_range,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY loan_range
ORDER BY total_loans DESC;

-- 19. Check income ranges

SELECT
    CASE
        WHEN annual_income < 30000 THEN 'Below 30K'
        WHEN annual_income < 60000 THEN '30K - 60K'
        WHEN annual_income < 100000 THEN '60K - 100K'
        ELSE '100K+'
    END AS income_range,
    COUNT(*) AS total_borrowers
FROM financial_loan
GROUP BY income_range
ORDER BY total_borrowers DESC;

-- 20. Check loan amount vs total payment

SELECT
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount,
    ROUND(AVG(total_payment), 2) AS avg_total_payment
FROM financial_loan;

-- 21. Calculate total loan amount and total payment

SELECT
    SUM(loan_amount) AS total_loan_amount,
    SUM(total_payment) AS total_payment
FROM financial_loan;

-- 22. Check average interest rate by grade

SELECT
    grade,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM financial_loan
GROUP BY grade
ORDER BY grade;

-- 23. Check average loan amount by grade

SELECT
    grade,
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM financial_loan
GROUP BY grade
ORDER BY grade;

-- 24. Check loan status by grade

SELECT
    grade,
    loan_status,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY grade, loan_status
ORDER BY grade, total_loans DESC;

-- 25. Monthly loan applications

SELECT
    DATE_TRUNC('month', issue_date) AS month,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY month
ORDER BY month;

-- 26. Monthly loan amount

SELECT
    DATE_TRUNC('month', issue_date) AS month,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan
GROUP BY month
ORDER BY month;

-- 27. State-wise loan amount

SELECT
    address_state,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan
GROUP BY address_state
ORDER BY total_loan_amount DESC;

-- 28. Check charged-off loans

SELECT
    COUNT(*) AS charged_off_loans,
    SUM(loan_amount) AS charged_off_amount
FROM financial_loan
WHERE loan_status = 'Charged Off';

-- 29. Good loan vs bad loan

SELECT
    CASE
        WHEN loan_status = 'Fully Paid' THEN 'Good Loan'
        WHEN loan_status = 'Charged Off' THEN 'Bad Loan'
        ELSE 'Current'
    END AS loan_category,
    COUNT(*) AS total_loans
FROM financial_loan
GROUP BY loan_category;